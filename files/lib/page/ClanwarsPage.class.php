<?php
namespace wcf\page;

use wcf\system\WCF;
use wcf\page\SortablePage;
use wcf\system\user\collapsible\content\UserCollapsibleContentHandler;
use wcf\data\package\PackageCache;

/**
 * Shows the clanwars
 *
 * @author  John "peoples" Erfurt
 * @copyright  2016 John "peoples" Erfurt
 * @license GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package eu.cywa.wcf.clanwars
 * @subpackage  page
 */
class ClanwarsPage extends SortablePage
{
    public $enableTracking = true;
    public $clanwars = null;
    public $defaultSortField = 'time';
    public $objectListClassName = 'wcf\data\clanwars\ClanwarsList';
    public $activeMenuItem = 'wcf.header.menu.clanwars';
    public $neededPermissions = array('user.board.clanwars.canView');
    public $defaultSortOrder = 'DESC';
    public $itemsPerPage = 20;
    public $templateName = 'clanwars';

    // sub package installed variable
    public $isInstalled = 0;

    // statistic variables
    public $playedClanwars = 0;
    public $playedClanwarsWon = 0;
    public $playedClanwarsLoss = 0;
    public $playedClanwarsDraw = 0;
    public $playedClanwarsRatio = 0;

    /**
     * list of valid sort fields
     * @var    array<string>
     */
    public $validSortFields = array('game', 'platform', 'status', 'time', 'clanname', 'gametype', 'league');

    public function readData()
    {
        parent::readData();

        // check if optional package is installed
        $package = PackageCache::getInstance()->getPackageByIdentifier('eu.cywa.wcf.clanwars.fightus');
        $this->isInstalled = $package ? 1 : 0;

        // select all played clanwars
        $sql = "SELECT COUNT(status) AS playedClanwars FROM wcf" . WCF_N . "_clanwars";
        $statement = WCF::getDB()->prepareStatement($sql);
        $statement->execute();
        $row = $statement->fetchArray();

        $this->playedClanwars = $row['playedClanwars'];

        // select won clanwars
        $sql = "SELECT COUNT(status) AS playedClanwarsWon FROM wcf" . WCF_N . "_clanwars WHERE status = 1";
        $statement = WCF::getDB()->prepareStatement($sql);
        $statement->execute();
        $row = $statement->fetchArray();

        $this->playedClanwarsWon = $row['playedClanwarsWon'];

        // select loss clanwars
        $sql = "SELECT COUNT(status) AS playedClanwarsLoss FROM wcf" . WCF_N . "_clanwars WHERE status = 2";
        $statement = WCF::getDB()->prepareStatement($sql);
        $statement->execute();
        $row = $statement->fetchArray();

        $this->playedClanwarsLoss = $row['playedClanwarsLoss'];

        // select draw clanwars
        $sql = "SELECT COUNT(status) AS playedClanwarsDraw FROM wcf" . WCF_N . "_clanwars WHERE status = 'X'";
        $statement = WCF::getDB()->prepareStatement($sql);
        $statement->execute();
        $row = $statement->fetchArray();

        $this->playedClanwarsDraw = $row['playedClanwarsDraw'];

        if ($this->playedClanwarsLoss !== 0) {
            $this->playedClanwarsRatio = round($this->playedClanwarsWon / $this->playedClanwarsLoss, 2);
        } else {
            $this->playedClanwarsRatio = 0;
        }
    }


    public function assignVariables()
    {
        parent::assignVariables();

        WCF::getTPL()->assign(array(
            'sidebarCollapsed' => UserCollapsibleContentHandler::getInstance()->isCollapsed('com.woltlab.wcf.collapsibleSidebar', 'com.woltlab.wcf.clanwars.ClanwarsPage'),
            'sidebarName' => 'com.woltlab.wcf.clanwars.ClanwarsPage',
            'isInstalled' => $this->isInstalled,
            'playedClanwars' => $this->playedClanwars,
            'playedClanwarsWon' => $this->playedClanwarsWon,
            'playedClanwarsLoss' => $this->playedClanwarsLoss,
            'playedClanwarsDraw' => $this->playedClanwarsDraw,
            'playedClanwarsRatio' => $this->playedClanwarsRatio
        ));
    }
}