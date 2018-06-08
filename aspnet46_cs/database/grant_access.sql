sp_grantlogin 'IIS APPPOOL\DefaultAppPool'
go

use Halloween
go

sp_grantlogin 'IIS APPPOOL\DefaultAppPool'
go

sp_grantdbaccess 'IIS APPPOOL\DefaultAppPool'
go

sp_addrolemember 'db_owner', 'IIS APPPOOL\DefaultAppPool'
go

exit