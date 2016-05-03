<?php
namespace wcf\acp\page;
use wcf\page\SortablePage;

/**
 * @author  John "peoples" Erfurt
 * @copyright  2016 John "peoples" Erfurt
 * @license  GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package  eu.cywa.wcf.clanwars
 * @category  Clanwars
 * subpackage  data
 */
class ClanwarsListPage extends SortablePage {
    public $templateName = 'clanwarsList';
    public $defaultSortField = 'clanwarID';
    public $objectListClassName = 'wcf\data\clanwars\ClanwarsList';
    public $activeMenuItem = 'wcf.acp.menu.link.community.clanwars.list';

    /**
     * list of valid sort fields
     * @var	array<string>
     */
    public $validSortFields = array('game','platform','status','result','time','clanname','clantag','gametype');

}