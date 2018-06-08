@ECHO off

:: batch file for
:: Murach's ASP.NET 4.6 Web Programming with C# 2015
:: company: Mike Murach & Associates, Inc.
:: date:    July 7, 2016
:: 
:: Uses SQLCMD utility to run a SQL script that grants
:: ASP.NET access to the Halloween database.

ECHO Attempting to grant ASP.NET access to the Halloween database . . . 
sqlcmd -S localhost\SQLExpress -E /i grant_access.sql
ECHO.
ECHO If no error message is shown, then access has been granted to the database.
ECHO.
PAUSE
