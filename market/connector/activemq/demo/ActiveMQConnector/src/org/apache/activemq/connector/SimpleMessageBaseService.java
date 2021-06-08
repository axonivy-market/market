package org.apache.activemq.connector;

import org.apache.activemq.ActiveMQConnectionFactory;

public class SimpleMessageBaseService {
	private ActiveMQConnectionFactory connectionFactory;
	
	public SimpleMessageBaseService(String brokerUrl) {
		connectionFactory = new ActiveMQConnectionFactory(brokerUrl);
	}
	public ActiveMQConnectionFactory getConnectionFactory() {
		return connectionFactory;
	}

	public void setConnectionFactory(ActiveMQConnectionFactory connectionFactory) {
		this.connectionFactory = connectionFactory;
	}

}
