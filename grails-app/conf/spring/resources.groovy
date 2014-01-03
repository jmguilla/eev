import com.mchange.v2.c3p0.ComboPooledDataSource

// Place your Spring DSL code here
beans = {
  /**
   * c3P0 pooled data source that allows 'DB keepalive' queries
   * to prevent stale/closed DB connections
   * Still using the JDBC configuration settings from DataSource.groovy
   * to have easy environment specific setup available
   */
  dataSource(ComboPooledDataSource) { bean ->
    bean.destroyMethod = 'close'
    //use grails' datasource configuration for connection user, password, driver and JDBC url
    user = grailsApplication.config.dataSource.username
    password = grailsApplication.config.dataSource.password
    driverClass = grailsApplication.config.dataSource.driverClassName
    jdbcUrl = grailsApplication.config.dataSource.url
    //connection test settings
    idleConnectionTestPeriod = 2 * 60 * 60 //2 hours
    testConnectionOnCheckin = true
  }
}