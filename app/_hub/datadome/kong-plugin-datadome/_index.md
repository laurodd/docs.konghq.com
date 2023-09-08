The DataDome plugin is developed in Lua and integrates smoothly with Kong.

This plugin will analyse in real time any API requests received. For each request, an api call is sent to DataDome Bot & Fraud Protection Platform to validate if this is legitimate or not.
The only thing to configure is your DataDome Server Side Key.

## How it works

The DataDome plugin will hook into the request/response of an API request and it is executed for every request from a client and before it is being proxied to the upstream on the access phase (see details [here](https://openresty-reference.readthedocs.io/en/latest/Directives/)).

## How to install

Custom plugins can be installed via LuaRocks. A Lua plugin is distributed in `.rock` format, which is
a self-contained package that can be installed locally or from a remote server.

If you used one of the official {{site.base_gateway}} installation packages, the LuaRocks utility
should already be installed in your system.
Install the `.rock` in your LuaRocks tree, that is, the directory in which LuaRocks
installs Lua modules.

1. Install the DataDome plugin:

    ```sh
    luarocks install kong-plugin-datadome
    ```

2. Update your loaded plugins list in {{site.base_gateway}}.

    In your `kong.conf`, append `datadome` to the `plugins` field. Make sure the field is not commented out.

    ```yaml
    plugins = bundled,datadome              # Comma-separated list of plugins this node
                                            # should load. By default, only plugins
                                            # bundled in official distributions are
                                            # loaded via the `bundled` keyword.
    ```

3. Restart {{site.base_gateway}}:

    ```sh
    kong restart
    ```

## Using the plugin

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
