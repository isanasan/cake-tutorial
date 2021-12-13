<?php

declare(strict_types=1);

namespace App\Controller\Component;

use Cake\Controller\Component;

/**
 * Util component
 */
class UtilComponent extends Component
{
    public function doComplexOperation(int $amount1, int $amount2): int
    {
        return $amount1 + $amount2;
    }
}
