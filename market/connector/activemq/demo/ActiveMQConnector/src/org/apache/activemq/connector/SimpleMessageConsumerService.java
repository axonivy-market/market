package org.apache.activemq.connector;

import javax.jms.Connection;
import javax.jms.Destination;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.Session;
import javax.jms.TextMessage;

import ch.ivyteam.ivy.bpm.error.BpmError;

public class SimpleMessageConsumerService extends SimpleMessageBaseService{
	
	
	public SimpleMessageConsumerService(String brokerUrl) {
		super(brokerUrl);
	}

	public String receiveMessageFromQueues(String queue) throws BpmError {
		String result = "";
		try {
	        // Create a Connection
	        Connection connection = getConnectionFactory().createConnection();
	        connection.start();

	        // Create a Session
	        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
	        Destination destination = session.createQueue(queue);

	        MessageConsumer consumer = session.createConsumer(destination);
            Message message = consumer.receive(1000);

            if (message instanceof TextMessage) {
                TextMessage textMessage = (TextMessage) message;
                result = textMessage.getText();
            }
	        
	        // Clean up
	        session.close();
	        connection.close();
		}catch(Exception e) {
			 BpmError.create("org:apache:activemq:receivemessage").withCause(e).throwError();			
		}
		return result;
	}

	
}