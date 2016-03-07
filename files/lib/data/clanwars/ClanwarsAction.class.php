<?php
namespace wcf\data\clanwars;

use wcf\data\AbstractDatabaseObjectAction;
use wcf\data\IToggleAction;
use wcf\system\database\util\PreparedStatementConditionBuilder;
use wcf\system\WCF;
use wcf\system\category\CategoryHandler;


/**
 * @author  John "peoples" Erfurt
 * @copyright  2016 John "peoples" Erfurt
 * @license  GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package  eu.cywa.wcf.clanwars
 * @subpackage  data.clanwars
 * @category  Clanwars
 */
class ClanwarsAction extends AbstractDatabaseObjectAction implements IToggleAction {

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$className
     */
    protected $className = 'wcf\data\clanwars\ClanwarsEditor';

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$permissionsDelete
     */
    protected $permissionsDelete = array('admin.community.clanwars.canDelete');

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$permissionsUpdate
     */
    protected $permissionsUpdate = array('admin.community.clanwars.canEdit');

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$requireACP
     */
    protected $requireACP = array('delete', 'toggle', 'update');


    /**
     * @see	\wcf\data\IToggleAction::validateToggle()
     */
    public function validateToggle() {
        parent::validateUpdate();
    }

    /**
     * @see	\wcf\data\IToggleAction::toggle()
     */
    public function toggle() {
        foreach ($this->objects as $cw) {
            $cw->update(array(
                'active' => $cw->active ? 0 : 1
            ));
        }
    }

}
