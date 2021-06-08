package org.apache.activemq.connector;

import javax.jms.Connection;
import javax.jms.DeliveryMode;
import javax.jms.Destination;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import ch.ivyteam.ivy.bpm.error.BpmError;

public class SimpleMessageProducerService extends SimpleMessageBaseService{
	
	public SimpleMessageProducerService(String brokerUrl) {
		super(brokerUrl);
	}

	public void sendMessageToQueue(String queue, String message) throws BpmError {
		
		try {
	        // Create a Connection
	        Connection connection = getConnectionFactory().createConnection();
	        connection.start();

	        // Create a Session
	        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
	        Destination destination = session.createQueue(queue);

	        MessageProducer producer = session.createProducer(destination);
	        producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);

	        TextMessage textMessage = session.createTextMessage(message);
	        producer.send(textMessage);
	        
	        // Clean up
	        session.close();
	        connection.close();
		}catch(Exception e) {
			 BpmError.create("org:apache:activemq:sendmessage").withCause(e).throwError();			
		}
	}
	
}