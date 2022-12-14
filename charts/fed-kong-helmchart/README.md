# Fed-Kong-Helmchart 
   #### This chart only used for `FedRAMP High (GCP PROD) `  only 

# Enable the Kong config for inbound traffic
##
1. MTLS inbound endpoint 
    * `fedpx.api.paloaltonetworks.us`
2. OAUTH inboud endpoint
    * `fedp.api.paloaltonetworks.us`


Please add following content to `ENVNAME_value.yaml` in override folder
---

```
###  Start here -- Kong config to enable Inboud traffic ###
appname: login-service       # this should your applications name should be the same as GKE service name ( dont add fed or any prefrix ) 
ingress:
  enabled: true  # |true or false enable or disable ingress 
  annotations:
  path: /login-service  # Change here
  hosts:
    - fedpx.api.paloaltonetworks.us

### MTLS config start  ###
mtls:
  enabled: true  # possible value true | false
  authchain: prod  # possible values  prod | QA   g2 or g3 for internal PKI

kongenv: kong-fedp  #kong Env possible value  kong-feds  ( FedRAMP QA ) | kong-fedp (Fedramp High)


# list of CN - required to create consumer
consumers:
  clients: # all cert CN names
    - login-service-il4 # CN put cert name here  # Change here 
    - login.api.paloaltonetworks.com             # Change here 


# list of CN - will give access to services once you add here ,MAKE SURE use  " Double Quote " in 'Single Quote'
mtlsAllow:
  clients:
    - '"login-service-il4"'    # Change here
    - '"login.api.paloaltonetworks.com"'      # Change here

### MTLS section end  ###
###  End here -- Kong config to enable Inboud traffic ###
```
---
# Kong supported Version 
  - 3.0.0.0  ( Fips enabled )
  - 3.1.0.0  ( Fips enabled )

# To-Do 
- OAUTH chart is pending
