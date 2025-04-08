# NEORV32 test

🚚 Test to check the following container: 🚚

- `ghcr.io/unike267/containers/impl-arty:latest` 

Through NEORV32 🚀 bitstream generation 🔗. From:

- `gh: stnolting/neorv32-setups`

**Goal:**

- Generate NEORV32 bitstream using: `GHDL + yosys + GHDL yosys plugin + nextpnr-xilinx + prjxray` 
    - To implement on the boards:
        - `Arty A7 35t`
        - `Arty A7 100t`

- The results are available in the repository's [actions](https://github.com/Unike267/Containers/actions) section.
    - Workflow: `Impl-Container` 
      - Jobs: `neorv32_impl_35t` and `neorv32_impl_100t`
        - Artifact names:
          - `neorv32_test_setup_bootloader_35t.bit` 
          - `neorv32_test_setup_bootloader_100t.bit` 


