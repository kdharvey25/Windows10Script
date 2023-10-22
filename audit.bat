echo Setting auditing success and failure for all categories
auditpol /set /category:* /success:enable
auditpol /set /category:* /failure:enable
echo Set auditing success and failure