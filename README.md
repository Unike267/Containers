# Containers repository 

The **goal** of this repository is to build 🔨 and push 📤 containers in continuous integration ♻️

📢 At the moment, the following containers are available: 📢

- `ghcr.io/unike267/containers/impl-arty:latest`
    - This container has: `GHDL + yosys + GHDL yosys plugin + nextpnr-xilinx + prjxray` to perform `synthesis + implementation + generate bitstream` on the boards:
        - `Arty A7 35t`
        - `Arty A7 100t`

- `ghcr.io/unike267/containers/latex-pygments:latest`
    - This container has: `latex` compiler with `pygments` program to use `minted` package

- `ghcr.io/unike267/containers/urv-toolchain:latest`
    - This container has the compilation tool for [urv-core](https://gitlab.com/ohwr/project/urv-core).

- `ghcr.io/unike267/containers/lm32-toolchain:latest` 
    - This container has the compilation tool for [lm32](https://gitlab.com/ohwr/project/general-cores/-/tree/master/modules/wishbone/wb_lm32).

- `ghcr.io/unike267/containers/schemdraw:latest`
    - This container has the drawing tool [schemdraw](https://github.com/cdelker/schemdraw).

