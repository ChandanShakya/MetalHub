<?php

namespace App\Providers;

use App\Modifiers\ShippingModifier;
use Illuminate\Support\ServiceProvider;
use Lunar\Admin\Support\Facades\LunarPanel;
use Lunar\Base\ShippingModifiers;
use Lunar\Shipping\ShippingPlugin;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {

        $brandAsset = function ($asset) {
            $publicPath = 'public/';
            if (file_exists(public_path($publicPath . $asset))) {
                return asset($publicPath . $asset);
            } else {
                $type = str($asset)->endsWith('.png') ? 'image/png' : 'image/svg+xml';
                // Use public_path to get the correct path to the public directory
                return "data:{$type};base64," . base64_encode(file_get_contents(public_path($asset)));
            }
        };
        LunarPanel::panel(
            fn($panel) => $panel
                ->brandName('MetalHub')
                ->path('admin')
                ->brandLogo($brandAsset('favicon.svg'))
                ->darkModeBrandLogo($brandAsset('favicon.svg'))
                ->favicon($brandAsset('favicon.svg'))
                ->plugins([
                    new ShippingPlugin,
                ])
        )
            ->register();
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(ShippingModifiers $shippingModifiers): void
    {
        $shippingModifiers->add(
            ShippingModifier::class
        );

        \Lunar\Facades\ModelManifest::replace(
            \Lunar\Models\Contracts\Product::class,
            \App\Models\Product::class,
            // \App\Models\CustomProduct::class,
        );
    }
}
