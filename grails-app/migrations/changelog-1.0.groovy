databaseChangeLog = {

	changeSet(author: "jmguilla (generated)", id: "1387118659747-1") {
		createTable(tableName: "answer") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "answerPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "eev_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "question_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "class", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(defaultValue: "-1", name: "int_answer", type: "integer")

			column(name: "answer", type: "varchar(255)")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-2") {
		createTable(tableName: "content") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "contentPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "rank", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "class", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "question_id", type: "bigint")

			column(name: "strengths_id", type: "bigint")

			column(name: "strengths_question_id", type: "bigint")

			column(name: "title", type: "varchar(255)")

			column(name: "weaknesses_id", type: "bigint")

			column(name: "weaknesses_question_id", type: "bigint")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-3") {
		createTable(tableName: "eevanswers") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "eevanswersPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "creation_date", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "eev_questions_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "interviewee", type: "varchar(255)")

			column(name: "interviewer", type: "varchar(255)")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-4") {
		createTable(tableName: "eevquestions") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "eevquestionsPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "title", type: "varchar(255)")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-5") {
		createTable(tableName: "eevquestions_content") {
			column(name: "eevquestions_contents_id", type: "bigint")

			column(name: "content_id", type: "bigint")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-6") {
		createTable(tableName: "eevrows_group_content") {
			column(name: "eevrows_group_contents_id", type: "bigint")

			column(name: "content_id", type: "bigint")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-7") {
		createTable(tableName: "question") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "questionPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "answer_type", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "question", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-8") {
		createTable(tableName: "role") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "rolePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "authority", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-9") {
		createTable(tableName: "user") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "userPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "account_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "account_locked", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "email", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "password", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "username", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-10") {
		createTable(tableName: "user_role") {
			column(name: "role_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-11") {
		addPrimaryKey(columnNames: "role_id, user_id", constraintName: "user_rolePK", tableName: "user_role")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-26") {
		createIndex(indexName: "FKABCA3FBE29A0898A", tableName: "answer") {
			column(name: "question_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-27") {
		createIndex(indexName: "FKABCA3FBE7E170773", tableName: "answer") {
			column(name: "eev_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-28") {
		createIndex(indexName: "FK38B7347920B94546", tableName: "content") {
			column(name: "weaknesses_question_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-29") {
		createIndex(indexName: "FK38B7347929A0898A", tableName: "content") {
			column(name: "question_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-30") {
		createIndex(indexName: "FK38B734794809F48F", tableName: "content") {
			column(name: "strengths_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-31") {
		createIndex(indexName: "FK38B73479730EC35B", tableName: "content") {
			column(name: "strengths_question_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-32") {
		createIndex(indexName: "FK38B734798A88E44", tableName: "content") {
			column(name: "weaknesses_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-33") {
		createIndex(indexName: "FK8F41D3DFE2964EBD", tableName: "eevanswers") {
			column(name: "eev_questions_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-34") {
		createIndex(indexName: "FKE120DE716BC2E5FF", tableName: "eevquestions_content") {
			column(name: "eevquestions_contents_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-35") {
		createIndex(indexName: "FKE120DE71DEDC178A", tableName: "eevquestions_content") {
			column(name: "content_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-36") {
		createIndex(indexName: "FKEFCB052911C27390", tableName: "eevrows_group_content") {
			column(name: "eevrows_group_contents_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-37") {
		createIndex(indexName: "FKEFCB0529DEDC178A", tableName: "eevrows_group_content") {
			column(name: "content_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-38") {
		createIndex(indexName: "authority_uniq_1387118659529", tableName: "role", unique: "true") {
			column(name: "authority")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-39") {
		createIndex(indexName: "email_uniq_1387118659532", tableName: "user", unique: "true") {
			column(name: "email")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-40") {
		createIndex(indexName: "username_uniq_1387118659533", tableName: "user", unique: "true") {
			column(name: "username")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-41") {
		createIndex(indexName: "FK143BF46A153EC78A", tableName: "user_role") {
			column(name: "role_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-42") {
		createIndex(indexName: "FK143BF46ABA698B6A", tableName: "user_role") {
			column(name: "user_id")
		}
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-12") {
		addForeignKeyConstraint(baseColumnNames: "eev_id", baseTableName: "answer", constraintName: "FKABCA3FBE7E170773", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "eevanswers", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-13") {
		addForeignKeyConstraint(baseColumnNames: "question_id", baseTableName: "answer", constraintName: "FKABCA3FBE29A0898A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "question", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-14") {
		addForeignKeyConstraint(baseColumnNames: "question_id", baseTableName: "content", constraintName: "FK38B7347929A0898A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "question", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-15") {
		addForeignKeyConstraint(baseColumnNames: "strengths_id", baseTableName: "content", constraintName: "FK38B734794809F48F", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "answer", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-16") {
		addForeignKeyConstraint(baseColumnNames: "strengths_question_id", baseTableName: "content", constraintName: "FK38B73479730EC35B", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "content", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-17") {
		addForeignKeyConstraint(baseColumnNames: "weaknesses_id", baseTableName: "content", constraintName: "FK38B734798A88E44", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "answer", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-18") {
		addForeignKeyConstraint(baseColumnNames: "weaknesses_question_id", baseTableName: "content", constraintName: "FK38B7347920B94546", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "content", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-19") {
		addForeignKeyConstraint(baseColumnNames: "eev_questions_id", baseTableName: "eevanswers", constraintName: "FK8F41D3DFE2964EBD", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "eevquestions", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-20") {
		addForeignKeyConstraint(baseColumnNames: "content_id", baseTableName: "eevquestions_content", constraintName: "FKE120DE71DEDC178A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "content", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-21") {
		addForeignKeyConstraint(baseColumnNames: "eevquestions_contents_id", baseTableName: "eevquestions_content", constraintName: "FKE120DE716BC2E5FF", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "eevquestions", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-22") {
		addForeignKeyConstraint(baseColumnNames: "content_id", baseTableName: "eevrows_group_content", constraintName: "FKEFCB0529DEDC178A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "content", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-23") {
		addForeignKeyConstraint(baseColumnNames: "eevrows_group_contents_id", baseTableName: "eevrows_group_content", constraintName: "FKEFCB052911C27390", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "content", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-24") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "user_role", constraintName: "FK143BF46A153EC78A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "role", referencesUniqueColumn: "false")
	}

	changeSet(author: "jmguilla (generated)", id: "1387118659747-25") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_role", constraintName: "FK143BF46ABA698B6A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}
}
