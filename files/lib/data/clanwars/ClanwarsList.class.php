<?php
namespace wcf\data\clanwars;
use wcf\data\DatabaseObjectList;

/**
 * @author  John "peoples" Erfurt
 * @copyright  2016 John "peoples" Erfurt
 * @license  GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package  eu.cywa.wcf.clanwars
 * @subpackage  data.clanwars
 * @category  Clanwars
 */
class ClanwarsList extends DatabaseObjectList {
    /**
     * @see	\wcf\data\DatabaseObjectList::$className
     */
    public $className = 'wcf\data\clanwars\Clanwars';
}
