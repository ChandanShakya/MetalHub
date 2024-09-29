<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Lunar\Models\Product;

class CalculateCollaborativeFiltering extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:calculate-collaborative-filtering';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        Product::calculateCollaborativeFilteringForAllProducts();
        $this->info('Collaborative filtering values calculated for all products.');
    }
}
