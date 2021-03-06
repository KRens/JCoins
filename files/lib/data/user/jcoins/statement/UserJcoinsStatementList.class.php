<?php
namespace wcf\data\user\jcoins\statement;

use wcf\data\DatabaseObjectList;

/**
 * Represents a statement list.
 * 
 * @author	Joshua Rüsweg
 * @package	de.joshsboard.jcoins
 */
class UserJcoinsStatementList extends DatabaseObjectList {

	/**
	 * @see	wcf\data\DatabaseObjectList::$className
	 */
	public $className = 'wcf\data\user\jcoins\statement\UserJcoinsStatement';

	/**
	 * @see	wcf\data\DatabaseObjectList::$sqlOrderBy
	 */
	public $sqlOrderBy = "user_jcoins_statement.time DESC";

}