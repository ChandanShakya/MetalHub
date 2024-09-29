<?php

namespace App\Livewire;

use Livewire\Component;
use Lunar\Models\Product;
use App\Models\AlgorithmCollaborative;

class TopProductsAlgorithm extends Component
{
    public $products;
    public function mount(){
        Product::calculateCollaborativeFilteringForAllProducts();
        $this->products = AlgorithmCollaborative::orderBy('filtering_value', 'desc')->take(5)->with('product')->get();
    }
    public function render()
    {
        return view('livewire.top-products-algorithm');
    }
}
