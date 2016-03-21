<?php
namespace wcf\acp\form;
use wcf\data\clanwars\Clanwars;
use wcf\data\clanwars\ClanwarsAction;
use wcf\form\AbstractForm;
use wcf\system\exception\IllegalLinkException;
use wcf\system\WCF;
/**
 * @author  John "peoples" Erfurt
 * @copyright  2016 John "peoples" Erfurt
 * @license	 GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package  eu.cywa.wcf.clanwars
 * @category  Clanwars
 * @subpackage  form
 */
class ClanwarsEditForm extends ClanwarsAddForm {

    public $activeMenuItem = 'wcf.acp.menu.link.community.clanwars.list';
    public $templateName = 'clanwarsList';
    public $clanwarID = 0;
    public $cw = null;



    /**
     * @see	\wcf\page\IPage::readParameters()
     */
    public function readParameters() {
        AbstractForm::readParameters();

        if (isset($_REQUEST['id'])) $this->clanwarID = intval($_REQUEST['id']);
        $this->cw = new Clanwars($this->clanwarID);
        if (!$this->cw->clanwarID) {
            throw new IllegalLinkException();
        }
    }



    /**
     * @see Form::validate()
     */
    public function save() {
        AbstractForm::save();

        // update
        $this->objectAction = new ClanwarsAction(array($this->clanwarID), 'update', array('data' => array_merge($this->additionalFields, array(
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
        ))));
        $this->objectAction->executeAction();

        $this->saved();

        // show success message
        WCF::getTPL()->assign(array(
            'success' => true
        ));

    }

    /**
     * @see Page::readData()
     */
    public function readData() {
        parent::readData();

        if (empty($_POST)) {
            // default value
            $this->game = $this->cw->game;
            $this->platform = $this->cw->platform;
            $this->result_h = $this->cw->result_h;
            $this->result_g = $this->cw->result_g;
            $this->clanname = $this->cw->clanname;
            $this->clantag = $this->cw->clantag;
            $this->clanlink = $this->cw->clanlink;
            $this->gametype = $this->cw->gametype;
            $this->xonx = $this->cw->xonx;
            $this->league = $this->cw->league;
            $this->maps = $this->cw->maps;
            $this->notes = $this->cw->notes;
            $this->time = $this->cw->time;
        }
    }


    /**
     * @see Page::assignVariables()
     */
    public function assignVariables() {
        parent::assignVariables();
        WCF::getTPL()->assign(array(
            'cw' => $this->cw,
            'action'    => 'edit'
        ));
    }
}
?>
