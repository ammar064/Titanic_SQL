USE[Titanic]  ;


select *
from[dbo].[titanic$];

---- first name and last name-----
select Name
from[dbo].[titanic$];




Select 
 PARSENAME(Replace(Name ,',','.'),1) as f
 ,PARSENAME(Replace(Name,',','.'),2) as t
  ,PARSENAME(Replace(Name,',','.'),3) as l
  
from[dbo].[titanic$];


/*Select 
 RIGHT(Name,LEN(Name)-CHARINDEX(',',Name))
  
from[dbo].[titanic$];*/



Alter Table [dbo].[titanic$]
Add FristName Char(50);

update [dbo].[titanic$]
set FristName= PARSENAME(Replace(Name ,',','.'),1)

--RIGHT(Name,LEN(Name)-CHARINDEX(',',Name));



Alter Table [dbo].[titanic$]
Add lastName Nvarchar(50);

update [dbo].[titanic$]
set lastName= PARSENAME(Replace(Name,',','.'),3);

 Alter Table [dbo].[titanic$]
Add Title Nvarchar(50);

update [dbo].[titanic$]
set Title= PARSENAME(Replace(Name,',','.'),2);


-------handling with Male and Female----

select Sex
from[dbo].[titanic$];

select  DISTINCT(Sex),COUNT(Sex)
from [dbo].[titanic$]
Group by Sex
 ;

SELECT Sex
 ,CASE  WHEN Sex ='male' THEN 'Male'
        Else  'Female'
       
  END 
from [dbo].[titanic$];



update [dbo].[titanic$]
set  Sex =CASE  WHEN Sex ='male' THEN 'Male'
        Else  'Female'
       
  END 

---------Cabin Class---------------
select Pclass
from[dbo].[titanic$];

select  DISTINCT(Pclass),COUNT(Pclass)
from [dbo].[titanic$]
Group by Pclass
 ;

SELECT Pclass
 ,CASE  WHEN Pclass =1 THEN 'Frist Class'
        WHEN Pclass =2 THEN 'Secand Class'          
        Else  'Third Class'
       
  END 
from [dbo].[titanic$];


 Alter Table [dbo].[titanic$]
Add NewPclass Nvarchar(50);

update [dbo].[titanic$]
set  NewPclass =CASE  WHEN Pclass =1 THEN 'Frist Class'
                   WHEN Pclass =2 THEN 'Secand Class'          
                   Else  'Third Class'
       
  END 
---------------Embarked---------------------

  Select *
  from [dbo].[titanic$]

  select  DISTINCT(Embarked),COUNT(Embarked)
from [dbo].[titanic$]
Group by Embarked
 ;

 SELECT Embarked
 ,CASE  WHEN Embarked ='S' THEN 'Southampton'
        WHEN Embarked ='Q' THEN 'Queenstown'  
		WHEN Embarked ='C'THEN 'Cherbourg'  
        Else  'Not Recorded'
       
  END 
from [dbo].[titanic$];


update [dbo].[titanic$]
set  Embarked =CASE  WHEN Embarked ='S' THEN 'Southampton'
        WHEN Embarked ='Q' THEN 'Queenstown'  
		WHEN Embarked ='C'THEN 'Cherbourg'  
        Else  'Not Recorded'
       
  END


  -----------Survived or Died----------------


select  DISTINCT(Survived),COUNT(Survived)
from [dbo].[titanic$]
Group by Survived
 ;


  Select*
  from [dbo].[titanic$];

 SELECT Survived
 ,CASE  WHEN Survived ='0' THEN 'Died'
        Else  'Survived'
       
  END 
from [dbo].[titanic$];


Alter Table [dbo].[titanic$]
Add Survived_OR_Deid Nvarchar(50);

update [dbo].[titanic$]
set  Survived_OR_Deid =CASE  WHEN Survived ='0' THEN 'Died'
        Else  'Survived'
       
  END 

 


 -----------Create Age category----------------

 SELECT Age
 ,CASE  WHEN Age <=10 THEN 'Kind'
        WHEN Age between 11 and 18  THEN 'Teenager'
        WHEN Age between 19 and 29  THEN 'Young'
		WHEN Age between 30 and 49  THEN 'Mature'
        Else  'Old'
       
  END 
from [dbo].[titanic$];



 Alter Table [dbo].[titanic$]
Add Age_Category Nvarchar(50);

update [dbo].[titanic$]
set  Age_Category =CASE  WHEN Age <=10 THEN 'Kind'
        WHEN Age between 11 and 18  THEN 'Teenager'
        WHEN Age between 19 and 29  THEN 'Young'
		WHEN Age between 30 and 49  THEN 'Mature'
		WHEN Age between 50 and 100  THEN 'Old'
        Else   'Not Recorded'
       
  END 
       
 ------Drop the unuseful Columns----------*
 
 
 ALTER TABLE [dbo].[titanic$]
DROP COLUMN Ticket, Cabin, Pclass,Survived,Parch,Fare ;



 
  Select*
  from [dbo].[titanic$];


  begin tran ;
  rollback;


