The DataDome plugin is developed in Lua and integrates smoothly with Kong.

This plugin will analyse in real time any API requests received. For each request, an api call is sent to DataDome Bot & Fraud Protection Platform to validate if this is legitimate or not.
The only thing to configure is your DataDome Server Side Key.

## How it works
The DataDome plugin will hook into the request/response of an API request and it is executed for every request from a client and before it is being proxied to the upstream on the access phase (see details [here](https://openresty-reference.readthedocs.io/en/latest/Directives/)).

## How to install

### Install the DataDome plugin

```shell
luarocks install kong-plugin-datadome
```

### Add DataDome to the loaded plugins list
You can choose one of the options below:

1. In your `kong.conf`, append `datadome` to the `plugins` variable.

```yaml
plugins = bundled,datadome       # Comma-separated list of plugins this node
                                 # should load. By default, only plugins
                                 # bundled in official distributions are
                                 # loaded via the `bundled` keyword.
```

2. Append `datadome` to the KONG_PLUGINS evironment variable.

```shell
KONG_PLUGINS = bundled,datadome
```

### Apply the plugin

You can restart Kong:

```shell
kong restart
```

Or, if you want to apply a plugin without stopping Kong:

```shell
kong prepare
kong reload
 ```


### Configuration

First of all, make sure you have your DataDome Server Side Key. It is available inside your [Dashboard > Integrations](https://app.datadome.co/dashboard/management/integrations).

#### Kong Gateway (OSS)
If you already have an API configured, execute the command below replacing the following `<values>`:

```shell
curl -i -X POST http://localhost:8001/services/<YOUR_API>/plugins \
     -F "name=datadome" \
     -F "config.datadome_server_side_key=<server_side_key>"
 ```

#### Kong Konnect

- Depending where you want to enable DataDome, select *Plugins*
- Click *+ New Plugin*
- On Custom Plugins, select *DataDome*
- Fill *Datadome Server Side Key*
- *Save*

For further information, please check our [DataDome Kong documentation page](https://docs.datadome.co/docs/kong-plugin).
