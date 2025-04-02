# Containers repository 

The **goal** of this repository is to build 🔨 and push 📤 containers in continuous integration ♻️

📢 At the moment, the following containers are available: 📢

- `ghcr.io/unike267/containers/impl-arty:latest`
    - This container has: `GHDL + yosys + GHDL yosys plugin + nextpnr-xilinx + prjxray` to perform `synthesis + implementation + generate bitstream` on the boards:
        - `Arty A7 35t`
        - `Arty A7 100t`

- `ghcr.io/unike267/containers/latex-pygments:latest`
    - This container has: `latex` compiler with `pygments` program to use `minted` package

- `ghcr.io/unike267/containers/urv-toolchain`
    - This container has the compilation tool for [urv-core](https://ohwr.org/project/urv-core).
