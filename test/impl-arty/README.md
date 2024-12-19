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

- These bitstreams are available in the repository [actions](https://github.com/Unike267/Containers/actions).
    - Workflow: `neorv32_impl` 
    - Artifact names:
        - `neorv32_impl_100t` 
        - `neorv32_impl_35t`  


