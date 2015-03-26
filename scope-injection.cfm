<cfsilent>
	<cfset pageScope = structNew()/>
	<cfset pageScope.message = "You are a regular user."/>

	<!--- Make sure the user is not isAdmin --->
	<cfif structKeyExists(session, "isAdmin")>
		<cfset structDelete(session, "isAdmin")/>
	</cfif>

	<!--- See if scope cascade finds this in the url scope --->
	<cftry>
		<cfif session.isAdmin eq 1>
			<cfset pageScope.message = "You are an administrator due to scope shenanigans."/>
		</cfif>
		<cfcatch>
			<!---
				The lookup for session.isAdmin was invalid.
				This is the behavior we would expect from a reasonable from a CFML engine.
			 --->
		</cfcatch>
	</cftry>
</cfsilent>
<!DOCTYPE html>
<html>
<head>
	<title>MiniApp: Test Scope Injection</title>
</head>
<body>
	<h1>MiniApp: Test Scope Injection</h1>

	<cfoutput>
		<h2>#pageScope.message#</h2>
	</cfoutput>

	<p>
		Try loading this page with some <a href="scope-injection.cfm?session.isAdmin=1">scope shenanigans</a>.
	</p>
</body>
</html>