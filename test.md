# Building Image on Pulga Zephyr

## First steps

After finishing the [Getting Started](https://github.com/caninos-loucos/pulga-zephyr?tab=readme-ov-file#getting-started) on README.md:

- First open a virtual envirommental and sincronize on terminal using the following code:
``` console
user@user:~$ cd path/to/where/venv/was/installed &&
source .venv/bin/activate &&
west update
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

To create a new device in [American Tower Conection](https://ns.atc.everynet.io/login?next=%2Fdevices) you have to follow this steps:
- Devices
    - Create Device
        - Activation = ABP
        - Encryption = NS
        - Class = A
        - Counter size = 4
        - Band = LA915-928A
        - After set up the configurations above create an aleatory number to:
            - Device EUI
            - Application EUI
            - Device address
            - Network session key
            - Application session key
            - And choose a tag to Tags field
        - To more details see [images](linkar_para_imagem_depois) bellow:

### In Coding 

Path: `PULGA-ZEPHY/app/comunicaition/lorawan/lorawan_buffer/lorawan_keys_exampla.h`

- dad

    - Device EUI = `LORAWAN_DEV_EUI`
    - Application EUI = `LORAWAN_APP_EUI`
    - Device address = `LORAWAN_DEV_ADDR`
        - dsd
    - Network session key =`LORAWAN_NET_KEY`
    - Application session key = `LORAWAN_APP_KEY`

``` c

#define LORAWAN_DEV_EUI {0x70, 0xc4, 0xde, 0x69, 0xf0, 0xa1, 0x1c, 0x40} 

#define LORAWAN_APP_EUI {0x95, 0x20, 0x86, 0x94, 0xe4, 0xc1, 0x68, 0xa7}

#define LORAWAN_APP_KEY {0xb7, 0xca, 0x29, 0xa9, 0x02, 0xcc, 0x38, 0x13, 0x9c, 0x8d, 0x2d, 0x86, 0x06, 0x42, 0xf2, 0x1b}


#define LORAWAN_NET_KEY {0x1e, 0x91, 0xcd, 0xec, 0xad, 0xe1, 0x68, 0x95, 0xc8, 0x54, 0xfe, 0x28, 0xe4, 0xdc, 0xeb, 0x78}


#define LORAWAN_DEV_ADDR 0xd96f77df

```


#### Images ilustratives
    
_________
## Building Image


