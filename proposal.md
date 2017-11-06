Name: Zhang Yunyuan           ID:   45975843

## Proposed Project

I'd like to build a appointment system for clinic. It's a console based system. Assume the clinic has several doctors. There're 2 types of users. Patients shall be able to pick certain doctor, then choose a date and time period available of that doctor to make appointment with him or her. The doctor shall be able to check his or her schedule.

## Outline Structure

One module defines doctors' moves. One module defines patients' moves. One module handles the database. There'd be a Gensever to keep tracking of information that user've inputed. Another Gensever uses the database module to insert, update, delete and query database. Both of the Genservers are expected to be supervised to make sure a restart in case of any failure. 


> replace all the ">" lines with your content, then push this to
> github and issue a merge request.
