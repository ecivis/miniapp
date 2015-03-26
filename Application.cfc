<cfcomponent>

	<cfset this.name = "miniapp"/>
	<cfset this.applicationTimeout = createTimeSpan(0,0,1,0)/>
	<cfset this.sessionManagement = true/>
	<cfset this.sessionTimeout = createTimeSpan(0,0,0,30)/>
	<cfset this.clientManagement = false/>
	<cfset this.setClientCookies = false/>

	<!--- Modern CFML engines support the following --->
	<cfset this.scopeCascading = "strict"/>

	<cffunction name="onApplicationStart" returntype="void" access="public" output="true">
		<cflog type="information" text="Started the #application.applicationName# application"/>
	</cffunction>

	<cffunction name="onApplicationEnd" returntype="void" access="public" output="false">
		<cfargument name="applicationScope" required="true"/>

		<cflog type="information" text="Stopped the #arguments.applicationScope.applicationName# application"/>
	</cffunction>

	<cffunction name="onSessionStart" returntype="void" access="public" output="true">
		<cflog type="information" text="Started a session for #session.sessionID#"/>
	</cffunction>

	<cffunction name="onSessionEnd" returntype="void" access="public" output="false">
		<cfargument name="sessionScope" required="true"/>
		<cfargument name="applicationScope" required="false"/>

		<cflog type="information" text="Stopped the #arguments.sessionScope.sessionID# session"/>
	</cffunction>

	<cffunction name="onRequestStart" returntype="void" access="public" output="true">
		<cfargument name="targetPage" type="string" required="true"/>

		<cflog type="information" text="Received request for #arguments.targetPage#"/>
	</cffunction>

</cfcomponent>