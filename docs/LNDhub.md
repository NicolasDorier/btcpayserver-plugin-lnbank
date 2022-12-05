# LNDhub Compatibility

LNbank offers a LNDhub-compatible API since v1.3.0.
This means that LNbank wallets are usable with the following wallet apps:

* [BlueWallet](https://bluewallet.io/)
* [Zeus](https://zeusln.app/)
* [Alby](https://getalby.com/)

These wallets offer import features, so that you can easily import your LNbank wallets into these apps.

:::tip NOTE
The prerequisite for a wallet to be accessible like this is having an access key with the admin permission tight to it.
The access keys can be managed by wallet admins on the LNbank wallet settings "Access Keys" page.
:::

## Importing the wallet

In the wallet settings you will find the "Connect LNDhub-compatible wallet" section.
It has a QR code and the account URL, which contain the details (server URL and credentials) to connect the apps.

:::danger WARNING
The credentials allow unrestricted access to your LNbank wallet.
Treat the QR code and account URL as confidential information!
:::

### BlueWallet

In BlueWallet you can use this path to import the wallet:

`Add Wallet > Import Wallet > Scan or import file`.

You can then scan the QR code from the LNbank wallet settings.
Once the wallet is imported, you can also set a name.

### Zeus

Unfortunately there is an [issue with Zeus, which prevents import via QR scan](https://github.com/ZeusLN/zeus/issues/1081).
Until this is fixed you have to import the wallet by entrering the details manually.

In Zeus you can use this path to import the wallet:

* Open the settings by clicking on the node icon in the top left corner.
* In the settings click the node (first row) to get to the list of nodes.
* Click the plus icon in the top right corner to add a new node/wallet.

You will land on the following screen and have to …

* Choose "LNDHub" as the "Node Interface"
* Enable the "Existing account" toggle

![Zeus Settings to import a LNbank wallet](./img/zeus-settings.png)

On that screen you then have to fill in the host, username and password fields.
The values for these fields are included in the account URL which you can copy on the LNbank wallet settings page.

Copy the account URL and paste it into a note app on your mobile device.
It consists of the following parts:

`lndhub:// USERNAME : PASSWORD @ HOST`

You can ignore the `lndhub://` part, the username and password are separated by an `:` and the host is what comes after the `@`.
Copy those values into the corresponding fields in Zeus and then click "Save node config".

The parts map like this:

* Username = LNbank Wallet ID
* Password = LNbank Wallet Access Key (Admin)
* Host = `YOUR_BTCPAY/plugins/lnbank/api/lndhub`

### Alby

In the Alby account dropdown, choos "Add a new account".
On the "Add a new lightning account" choose "LNDHub (BlueWallet)".

Now you can either copy and paste the account URL from the LNbank wallet settings page or scan the QR code.
Once the account is initialized, you should see a "Success!" message.
