<?php
namespace wcf\acp\form;
use wcf\data\clanwars\ClanwarsAction;
use wcf\form\AbstractForm;
use wcf\system\WCF;
use wcf\util\DateUtil;
use wcf\system\exception\UserInputException;

/**
 * @author  John "peoples" Erfurt
 * @copyright  2016 John "peoples" Erfurt
 * @license  GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package  eu.cywa.wcf.clanwars
 * @category  wcf.acp
 * @subpackage  form
 */
class ClanwarsAddForm extends AbstractForm {
    /**
     * @see \wcf\page\AbstractPage::$activeMenuItem
     */
    public $activeMenuItem = 'wcf.acp.menu.link.community.clanwars.add';
    public $templateName = 'clanwarsAdd';

    // parameters
    public $clanwarID = '';
    public $game = '';
    public $platform = '';
    public $status = '';
    public $result_h = '';
    public $result_g = '';
    public $time = '';
    public $clanname = '';
    public $clantag = '';
    public $clanlink = '';
    public $gametype = '';
    public $xonx = '';
    public $league = '';
    public $maps = '';
    public $notes = '';


    /**
     * @see Form::readFormParameters()
     */
    public function readFormParameters() {
        parent::readFormParameters();

        if (isset($_POST['clanwarID'])) $this->clanwarID = $_POST['clanwarID'];
        if (isset($_POST['game'])) $this->game = $_POST['game'];
        if (isset($_POST['platform'])) $this->platform = $_POST['platform'];
        if (isset($_POST['result_h'])) $this->result_h = intval($_POST['result_h']);
        if (isset($_POST['result_g'])) $this->result_g = intval($_POST['result_g']);
        if (isset($_POST['time'])) $this->time = $_POST['time'];
        if (isset($_POST['clanname'])) $this->clanname = $_POST['clanname'];
        if (isset($_POST['clantag'])) $this->clantag = $_POST['clantag'];
        if (isset($_POST['clanlink'])) $this->clanlink = $_POST['clanlink'];
        if (isset($_POST['gametype'])) $this->gametype = $_POST['gametype'];
        if (isset($_POST['xonx'])) $this->xonx = $_POST['xonx'];
        if (isset($_POST['league'])) $this->league = $_POST['league'];
        if (isset($_POST['maps'])) $this->maps = $_POST['maps'];
        if (isset($_POST['notes'])) $this->notes = $_POST['notes'];
    }

    /**
     * @see \wcf\form\IForm::validate()
     */
    public function validate() {
        parent::validate();
        $this->checkResult();
        $this->validateTime();

        if (empty($this->clanname)) {
            throw new UserInputException('clanname','empty');
        }

        if (empty($this->clantag)) {
            throw new UserInputException('clantag','empty');
        }

        if (empty($this->gametype)) {
            throw new UserInputException('gametype','empty');
        }

        if (empty($this->league)) {
            throw new UserInputException('league','empty');
        }

        if (empty($this->maps)) {
            throw new UserInputException('maps','empty');
        }

        if ($this->result_h < 0) {
            throw new UserInputException('result_h','empty');
        }

        if ($this->result_g < 0) {
            throw new UserInputException('result_g','empty');
        }

        if (empty($this->time)) {
            throw new UserInputException('time','empty');
        }

        //if (!DateUtil::validateDate($this->time)) {
        //    throw new UserInputException('time','');
        //}
    }

    /**
     * check result and merge it for display / set status
     */
    public function checkResult() {
        if ($this->result_h > $this->result_g) {
            $this->status = '1';
        }
        elseif ($this->result_h == $this->result_g) {
            $this->status = 'x';
        }
        else {
            $this->status = '2';
        }
    }

    /**
     * convert iso time in unix format
     */
    public function validateTime() {
        $this->time = strtotime($this->time);
    }

    /**
     * @see Form::save()
     */
    public function save() {
        parent::save();

        $this->objectAction = new ClanwarsAction(array(), 'create', array('data' => array_merge($this->additionalFields, array(
            'game' => $this->game,
            'platform' => $this->platform,
            'status' => $this->status,
            'result_h' => $this->result_h,
            'result_g' => $this->result_g,
            'time' => $this->time,
            'clanname' => $this->clanname,
            'clantag' => $this->clantag,
            'clanlink' => $this->clanlink,
            'gametype' => $this->gametype,
            'xonx' => $this->xonx,
            'league' => $this->league,
            'maps' => $this->maps,
            'notes' => $this->notes

        ))));
        $this->objectAction->executeAction();

        $this->saved();

        // reset values
        $this->game;
        $this->platform;
        $this->status;
        $this->result_h;
        $this->result_g;
        $this->time;
        $this->clanname;
        $this->clantag;
        $this->clanlink;
        $this->gametype;
        $this->xonx;
        $this->league;
        $this->maps;
        $this->notes;

        // show success
        WCF::getTPL()->assign(array(
            'success' => true
        ));
    }

    /**
     * @see Page::assignVariables()
     */
    public function assignVariables() {
        parent::assignVariables();

        WCF::getTPL()->assign(array(
            'game' => $this->game,
            'platform' => $this->platform,
            'status' => $this->status,
            'result_h' => $this->result_h,
            'result_g' => $this->result_g,
            'time' => $this->time,
            'clanname' => $this->clanname,
            'clantag' => $this->clantag,
            'clanlink' => $this->clanlink,
            'gametype' => $this->gametype,
            'xonx' => $this->xonx,
            'league' => $this->league,
            'maps' => $this->maps,
            'notes' => $this->notes,
            'action' => 'add'
        ));
    }
}
?>