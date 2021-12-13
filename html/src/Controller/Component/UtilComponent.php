<?php

declare(strict_types=1);

namespace App\Controller\Component;

use Cake\Controller\Component;

/**
 * Util component
 */
class UtilComponent extends Component
{
    use \Cake\ORM\Locator\LocatorAwareTrait;

    public function doComplexOperation(int $amount1, int $amount2): int
    {
        return $amount1 + $amount2;
    }

    /**
     * @return \App\Model\Entity\User[]
     */
    public function findUsersForIndex(): array
    {
        return $this->fetchTable('Users')
            ->find()
            ->contain([
                'UserLoginCredentials',
                'UserPrivacies',
                'UserPublicProfiles',
            ])
            ->all()
            ->toList();
    }
}
