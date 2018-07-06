package com.ds.storebackend.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages= {"com.ds.storebackend.dto"})
@EnableTransactionManagement
public class HibernateConfig {

	private final static String DATABASE_URL = "jdbc:postgresql://localhost:5432/snowstore";
	private final static String DATABASE_DRIVER = "org.postgresql.Driver";
	private final static String DATABASE_DIALECT = "org.hibernate.dialect.PostgreSQLDialect";
	private final static String DATABASE_USERNAME = "postgres";
	private final static String DATABASE_PASSWORD = "root";
	
	// dataSource bean will be available
	@Bean
	public DataSource getDataSource() {
		
		BasicDataSource dataSource = new BasicDataSource();
		
		// Providing the database connection information
		dataSource.setDriverClassName(DATABASE_DRIVER);
		dataSource.setUrl(DATABASE_URL);
		dataSource.setUsername(DATABASE_USERNAME);
		dataSource.setPassword(DATABASE_PASSWORD);
		
		return dataSource;
		
	}
	
	// sessionFactory will be available
	@Bean
	public SessionFactory getSessionFactory(DataSource dataSource) {
		
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource);
		
		builder.addProperties(getHibernateProperties());
		builder.scanPackages("com.ds.storebackend.dto");
		
		return builder.buildSessionFactory();
	}
	
	
    // All the Hibernate properties will be returned in this method
	private Properties getHibernateProperties() {
		
		Properties properties = new Properties();
		
		properties.put("hibernate.dialect", DATABASE_DIALECT);
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.format_sql", "true");
		
		
		// use validate instead of update for postgresql
		properties.put("hibernate.hbm2ddl.auto", "validate");
		
		return properties;
	}
	
	// transactionManager bean
	@Bean
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}
	
	
	
}
