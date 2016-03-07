<?php
namespace wcf\data\clanwars;
use wcf\data\DatabaseObjectEditor;
use wcf\system\WCF;
use \wcf\system\category\CategoryHandler;

/**
 * @author  John "peoples" Erfurt
 * @copyright  2016 John "peoples" Erfurt
 * @license  GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package  eu.cywa.wcf.clanwars
 * @subpackage  data.clanwars
 * @category  Clanwars
 */
class ClanwarsEditor extends DatabaseObjectEditor {
    /**
     * @see	\wcf\data\DatabaseObjectEditor::$baseClass
     */
    protected static $baseClass = 'wcf\data\clanwars\Clanwars';

}
