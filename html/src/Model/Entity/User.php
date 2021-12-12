<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * User Entity
 *
 * @property int $id
 * @property int $user_login_credential_id
 * @property int $user_public_profile_id
 * @property int $user_privacy_id
 * @property \Cake\I18n\FrozenTime|null $created
 * @property \Cake\I18n\FrozenTime|null $modified
 *
 * @property \App\Model\Entity\UserLoginCredential[] $user_login_credentials
 * @property \App\Model\Entity\UserPublicProfile[] $user_public_profiles
 * @property \App\Model\Entity\UserPrivacy[] $user_privacies
 * @property \App\Model\Entity\Article[] $articles
 */
class User extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        'user_login_credential_id' => true,
        'user_public_profile_id' => true,
        'user_privacy_id' => true,
        'created' => true,
        'modified' => true,
        'user_login_credentials' => true,
        'user_public_profiles' => true,
        'user_privacies' => true,
        'articles' => true,
    ];
}
