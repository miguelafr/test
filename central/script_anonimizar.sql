##############################
# anonymize_clc_db.sql
##############################
 
#User table
UPDATE User SET username = concat('login',id) where username != 'admin';
UPDATE User SET password = 'YWRtaW4';
  
#Person table
UPDATE Person SET firstName = concat('firstName',id);
UPDATE Person SET lastName = concat('lastName',id);
UPDATE Person SET lastName = concat('lastName',id);
UPDATE Person SET email = 'mailtesting@kubbe.es';
  
#PersonDetails table
UPDATE PersonDetails SET mobilePhoneNumber= concat(id,id);;
UPDATE PersonDetails SET officePhoneNumber= concat(id,id);;
  
  
# Deleting notifications
#DELETE FROM UserNotification;
#DELETE FROM Notification;
UPDATE UserNotification SET receiverEmail ='mailtesting@kubbe.es';
UPDATE NotificationDetails SET content ='ANONIMIZED', toDescription ='Anonimized';
UPDATE Notification SET subject = ' ANONIMIZED';

# CHANGE EMAIL ACCOUNT CONFIGURED ON NOTIFICATIONS FROM SETTINGS
delete from ConfigurationSettings ;




# Changing virtualroom account credentials

UPDATE WebConferenceAccount SET name='netex1', password='welcome123';
UPDATE Room SET contactEmail='mailtesting@kubbe.es' WHERE DTYPE='PhysicalRoom' and contactEmail IS NOT NULL;
UPDATE Room SET name=CONCAT('netex 1 - ',name) WHERE DTYPE='WebConferenceRoom';


#anonimizando correos
update TinCanObjectStore set object_value = REPLACE(object_value,'@cetelem.es','@kubbe.es') WHERE object_value like '%@cetelem.es%';
update TinCanObjectStore set object_value = REPLACE(object_value,'@netexlearning.com','@kubbe.es') WHERE object_value like '%@netexlearning.com%';
update TinCanObjectStore set object_value = REPLACE(object_value,'@netexcompany.com','@kubbe.es') WHERE object_value like '%@netexcompany.com%';

