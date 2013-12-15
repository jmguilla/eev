hibernate {
  cache.use_second_level_cache = true
  cache.use_query_cache = false
  cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
  //    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
  development {
    dataSource {
      pooled = true
      driverClassName = "org.h2.Driver"
      username = "sa"
      password = ""
      dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
      url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
    }
  }
  test {
    dataSource {
      pooled = true
      driverClassName = "org.h2.Driver"
      username = "sa"
      password = ""
      dbCreate = "update"
      url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
    }
  }
  production {
    dataSource {
      pooled = true
      driverClassName = "com.mysql.jdbc.Driver"
      dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
      username = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME")
      password = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD")
      url = "jdbc:mysql://${System.getenv('OPENSHIFT_MYSQL_DB_HOST')}:${System.getenv('OPENSHIFT_MYSQL_DB_PORT')}/ecouteentretien?useUnicode=yes&characterEncoding=UTF-8"
      //      dbCreate = "update"
      //            properties {
      //               maxActive = -1
      //               minEvictableIdleTimeMillis=1800000
      //               timeBetweenEvictionRunsMillis=1800000
      //               numTestsPerEvictionRun=3
      //               testOnBorrow=true
      //               testWhileIdle=true
      //               testOnReturn=false
      //               validationQuery="SELECT 1"
      //               jdbcInterceptors="ConnectionState"
      //            }
    }
  }
}
