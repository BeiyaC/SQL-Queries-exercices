<?php

test('query-5.sql : Liste des produits (nom, quantité et prix unitaire) de la commande 1', function() {
    $orders_and_products = \Illuminate\Support\Facades\DB::table('order_product')->get();
    $products_for_order = $orders_and_products
        ->filter(function ($op) { return $op->order_id === 1; })
        ->pluck('product_id');
    $expected = \Illuminate\Support\Facades\DB::table('products')
                                              ->whereIn('id', $products_for_order)
                                              ->get();

    $result = runQuery(5);
    $this->assertCount(
        $expected->count(),
        $result,
        'la requête ne retourne pas le bon nombre de résultats'
    );
    foreach ($result as $po) {
        $this->assertObjectHasAttribute('name', $po, "Il manque le nom de l'article");
        $this->assertObjectHasAttribute('quantity', $po, "Il manque la quantitée");
        $this->assertObjectHasAttribute('price', $po, "Il manque le prix unitaire");
    }

})->skip(!file_exists(dirname(__DIR__)."/../results/queries/query-5.sql")
    , 'Il manque le fichier query-5.sql');

test('query-6.sql : Liste de toutes les commandes : Numéro + Prix total de la commande (calculé sur la base des prix des articles et des quantités de la commande)', function() {
    $expected = getOrdersCollection();

    $results = runQuery(6);

    $this->assertCount(
        \Illuminate\Support\Facades\DB::table('orders')->count(),
        $expected, // expected must containt the same number of lines that orders
        'Erreur inconnue - vérifiez vos données'
    );
    $this->assertCount(
        \Illuminate\Support\Facades\DB::table('orders')->count(),
        $results,
        'la requête ne retourne pas le bon nombre de résultats'
    );

    $expected_array = $expected->mapWithKeys(function ($item) { return [$item['number'] => $item['total']]; })->toArray();
    $results_array = collect($results)->mapWithKeys(function ($result) {
        $array = array_values(get_object_vars($result)); // transform objet to array
        return [$array[0] => (int) $array[1]];
    })->toArray();

    ksort($expected_array);
    ksort($results_array);

    $this->assertEquals($expected_array, $results_array);

})->skip(!file_exists(dirname(__DIR__)."/../results/queries/query-6.sql")
    , 'Il manque le fichier query-6.sql');


test('query-7.sql : Montant total des commandes d’aujourd’hui.', function() {
    $expected = getOrdersCollection();
    $result = runQuery(7);

    $this->assertCount(
        1,
        $result,
        'la requête doit retourner une seule ligne'
    );

    $total_expected = $expected->filter(function ($commande) { return Carbon\Carbon::parse($commande['date'])->isToday(); })->sum('total');
    $total_result = (int) array_values(get_object_vars($result[0]))[0];

    $this->assertEquals($total_expected, $total_result);

})->skip(!file_exists(dirname(__DIR__)."/../results/queries/query-7.sql")
    , 'Il manque le fichier query-7.sql');

test('query-8.sql : Liste des commandes dont le prix est entre 100 et 550 euros', function() {
    $expected = getOrdersCollection()->filter(function ($commande) {
        return $commande['total'] > 100 && $commande['total'] < 550;
    });
    $results = runQuery(8);

    $this->assertCount(
        $expected->count(),
        $results, // expected must containt the same number of lines that orders
        'la requête ne retourne pas le bon nombre de résultats'
    );

    // Copy from Query-6 // TODO : refactoring
    $expected_array = $expected->mapWithKeys(function ($item) { return [$item['number'] => $item['total']]; })->toArray();
    $results_array = collect($results)->mapWithKeys(function ($result) {
        $array = array_values(get_object_vars($result)); // transform objet to array
        return [$array[0] => (int) $array[1]];
    })->toArray();

    ksort($expected_array);
    ksort($results_array);

    $this->assertEquals($expected_array, $results_array);

})->skip(!file_exists(dirname(__DIR__)."/../results/queries/query-8.sql")
    , 'Il manque le fichier query-8.sql');

