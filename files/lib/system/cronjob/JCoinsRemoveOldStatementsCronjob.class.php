<?php
namespace wcf\system\cronjob;
use wcf\data\cronjob\Cronjob;
use wcf\data\jCoins\statement\StatementAction;
use wcf\data\jCoins\statement\StatementList;

/**
 * removing old statements
 * 
 * @author	Joshua Rüsweg
 * @package	de.joshsboard.jcoins
 * @subpackage	system.cronjob
 * @category	Community Framework
 */
class JCoinsRemoveOldStatementsCronjob extends AbstractCronjob {
	/**
	 * @see	wcf\system\cronjob\ICronjob::execute()
	 */
	public function execute(Cronjob $cronjob) {
		parent::execute($cronjob);
		
		$statementList = new StatementList();
		$statementList->getConditionBuilder()->add('statement_entrys.time < ?', array(TIME_NOW - 86400 * JCOINS_STATEMENTS_DELETEAFTER));
		if (JCOINS_STATEMENTS_DELETEONLYTRASHED) $statementList->getConditionBuilder()->add('statement_entrys.isTrashed = ?', array(1));
		$statementList->readObjects();
		
		$statementAction = new StatementAction($statementList->getObjects(), 'delete');
		$statementAction->executeAction();
	}
}
