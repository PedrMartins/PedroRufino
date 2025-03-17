# Building Image on Pulga Zephyr

## First steps

After finishing the [Getting Started](https://github.com/caninos-loucos/pulga-zephyr?tab=readme-ov-file#getting-started) on README.md:

- First open a virtual envirommental and sincronize on terminal using the following code:

``` console
cd path/to/where/venv/was/installed && source .venv/bin/activate && west update
```

So now it's possible make changes inside the code

In the `PULGA-ZEPHYR\app` 
- Open the `CMakeLists.txt` file:

    - Uncomment
        - `list(APPEND SHIELD pulga-lora)`
        - `list(APPEND SHIELD scd30)`

- Open the `prj.config` file:
    - Change the paramters 
        ``` c
        CONFIG_TRANSMISSION_INTERVAL= 300000    //  in miliseconds
        CONFIG_SAMPLING_INTERVAL= 1800000       //  in miliseconds
        CONFIG_LORAWAN_DR=0                     //  must be fillded with 0
        ```

        > For more details read this [sections](https://github.com/caninos-loucos/pulga-zephyr?tab=readme-ov-file#application-configurations) on README.md
_________
## Connecting the Fimrware to Network

### In American Tower Conection

#### Create Device

To create a new device in [American Tower Conection](https://ns.atc.everynet.io/login?next=%2Fdevices) you have to follow this steps:
- Devices
    - Create Device
        - Activation = ABP
        - Encryption = NS
        - Class = A
        - Counter size = 4
        - Band = LA915-928A
        - After set up the configurations above create an aleatory number to:
            - Device EUI `64-bit`
            - Application EUI `64-bit`
            - Device address `32-bit`
            - Network session key `128-bit`
            - Application session key `128-bit`
            - And choose a tag to Tags field
        - To more details see [images](linkar_para_imagem_depois) bellow:

#### Create Filter

- Device tags &rarr; **Choose a tag, must to be the same that you put in Device section**
- Message types &rarr; Select just the `uplink`
- to more details see [images]() bellow

#### Create Connection

- First select the `HTTP v2` 
- filter &rarr; use the key from filter section
- Application URL &rarr; the link from Google Sheets
    - see the [Google Sheets]() section bellow to more details

### In Coding 

Path: `PULGA-ZEPHY/app/comunicaition/lorawan/lorawan_buffer/lorawan_keys_exampla.h`
- Here, the code must to match with the same number in the site

    - Device EUI = `LORAWAN_DEV_EUI` 
    - Application EUI = `LORAWAN_APP_EUI`
    - Device address = `LORAWAN_DEV_ADDR`
    - Network session key =`LORAWAN_NET_KEY`
    - Application session key = `LORAWAN_APP_KEY`

``` c
//The "0x" i's a indcation that the number will be read as binary

#define LORAWAN_DEV_EUI {0x70, 0xc4, 0xde, 0x69, 0xf0, 0xa1, 0x1c, 0x40} 

/*
To transform the hexadecimal key to binary you might copy the key generated in site or in any generator site

and paste here, after you can do the folloing steps:
    paste -> 70c4de69f0a11c40
    put comma -> ,70,c4,de,69,f0,a1,1c,40
    find -> ,
    and replace to -> , 0x
    result -> 0x70, 0xc4, 0xde, 0x69, 0xf0, 0xa1, 0x1c, 0x40

    repeat this for all other keys
*/


#define LORAWAN_APP_EUI {0x95, 0x20, 0x86, 0x94, 0xe4, 0xc1, 0x68, 0xa7}

#define LORAWAN_APP_KEY {0xb7, 0xca, 0x29, 0xa9, 0x02, 0xcc, 0x38, 0x13, 0x9c, 0x8d, 0x2d, 0x86, 0x06, 0x42, 0xf2, 0x1b}


#define LORAWAN_NET_KEY {0x1e, 0x91, 0xcd, 0xec, 0xad, 0xe1, 0x68, 0x95, 0xc8, 0x54, 0xfe, 0x28, 0xe4, 0xdc, 0xeb, 0x78}


#define LORAWAN_DEV_ADDR 0xd96f77df

```
### In Google Sheets

- Paht:
    - 
- Google Sheet using Id: 
    - example
        - docs.google.com/spreadsheets/d/<span style="background-color: #FFC0CB">1sO6Xqce1NKMzsS28SWCquOBqy7wZhiUHdqbM6FaCgrY </span>/edit?gid=0#gid=0

``` c#

function doPost(request){
  // Open Google Sheet using ID
  var sheet = SpreadsheetApp.openById("1zV8ZpDkXloRghM3c0efpS_R3KxPWLPkMjbgJ9PT_euI").getActiveSheet();
  var result = {"status": "SUCCESS"};
  try{
    // Parse request data
    var data = JSON.parse(request.postData.contents);
    var decoded = Utilities.base64Decode(data.params.payload, Utilities.Charset.UTF_8);
    var payloadStr = Utilities.newBlob(decoded).getDataAsString();

    // Define column mapping - 2 characters indicators come first so it doesn't
    // match the wrong column when processing the payload
    var columnMap = {
      "T": "Temperature", "P": "Pressure", "H": "Humidity",
      "AC": "Acceleration", "R": "Rotation", "LT": "Latitude",
      "LG": "Longitude", "B": "Bearing Angle", "S": "Speed",
      "AL": "Altitude", "TS": "GNSS Time", "D": "GNSS Date",
      "L": "Luminosity", "IR": "Infrared", "UV": "UV Intensity",
      "I": "UV Index", "CO2": "CO2 Concentration"
    };

    // Time the LoRaWAN gateway processed the data
    // Use formattedDate and formattedHour to identify rows uniquely
    var gatewayTime = data.meta.time;
    var gatewayDate = new Date(gatewayTime * 1000);
    var formattedDate = Utilities.formatDate(gatewayDate, "GMT-3:00", "dd-MM-yyyy");
    var formattedHour = Utilities.formatDate(gatewayDate, "GMT-3:00", "HH:mm:ss");
    // Gets sheet headers
    var headers = sheet.getRange(1, 1, 1, sheet.getLastColumn()).getValues()[0];

    // Function to find row where to insert data
    function findInsertingRow(formattedDate, formattedHour) {
      // Gets last row with data
      // Gets indexes of Date and Time columns
      var dateColumn = headers.indexOf("Date");
      var timeColumn = headers.indexOf("Time");

      // Gets data values
      var dataValues = sheet.getDataRange().getDisplayValues();
      // Tries to find existing row with matching date and time
      // Start from last row with data, tries to find in last 10 rows, excluding headers
      for (var i = dataValues.length - 1; i > 0 && i > dataValues.length - 10; i--) {
          var existingDate = dataValues[i][dateColumn];
          var existingHour = dataValues[i][timeColumn];
          //sheet.appendRow([i, existingDate, existingHour, formattedDate, formattedHour]);
          if (!existingDate.localeCompare(formattedDate) && !existingHour.localeCompare(formattedHour)) {
            return i + 1; // Return row index (Google Sheets rows start at 1)
          }
      }
      
      // Adds new row if not found
      var lastRow = sheet.getLastRow() + 1;
      sheet.getRange(lastRow, dateColumn + 1).setValue(formattedDate);
      sheet.getRange(lastRow, timeColumn + 1).setValue(formattedHour);
      return lastRow;
    }

    var row = findInsertingRow(formattedDate, formattedHour);

    // Iterate over known indicators in the payload 
    Object.keys(columnMap).forEach(function(indicator) {
      var regex = new RegExp(indicator + "(\\d+(?:\\.\\d+)?)", "g");
      // Update row with payload data
      var matches;
      while ((matches = regex.exec(payloadStr)) !== null) {
        var value = matches[1].replace(".", ","); // Get numeric value
        var column = headers.indexOf(columnMap[indicator]) + 1;
        if (column > 0) {
          var cell = sheet.getRange(row, column);
          if (cell.isBlank()) {
            cell.setValue(value);
          }
        }
      }
    });

  }catch(exc){
    // If error occurs, throw exception
    result = {"status": "FAILED", "message": exc};
  }

  // Return result
  return ContentService
  .createTextOutput(JSON.stringify(result))
  .setMimeType(ContentService.MimeType.JSON);
}

```
#### Images ilustratives


    
_________
## Building Image

