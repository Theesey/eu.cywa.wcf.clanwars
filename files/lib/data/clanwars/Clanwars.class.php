<?php

namespace wcf\data\clanwars;

use wcf\system\WCF;
use wcf\system\exception\SystemException;
use wcf\data\DatabaseObject;
use wcf\data\ICategorizedObject;
use wcf\system\category\CategoryHandler;
/**
 * @author  John "peoples" Erfurt
 * @copyright  2016 John "peoples" Erfurt
 * @license  GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package  eu.cywa.wcf.clanwars
 * @subpackage  data
 * @category  Clanwars
 */
class Clanwars extends DatabaseObject {

    protected static $databaseTableName = 'clanwars';
    protected static $databaseTableIndexName = 'clanwarID';

    /**
     * @see	wcf\data\ICategorized::getCategory()
     */
    public function getCategory() {
        return CategoryHandler::getInstance()->getCategory($this->categoryID);
    }

}
