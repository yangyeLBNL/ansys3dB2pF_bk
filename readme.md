# EIC B2pF 3D mechanical analysis
ANSYS script for the 3D mechanical analysis, EIC B2pF (bladder and key)

ver.1 (05/27/2026)
   - magnet assembly with bladder and keys
ver.2 (06/04/2026)
   - change the contact setting to improve the convergence

Y.Yang, G. Vallone (LBNL)

## simulation steps
1. middle plane shimming, install the structures
2. loading the coil with 100% of axial load
3. loading the coil with 100% of azimuthal load 
4. cool-down
5. powering

## contact stiffness
The contact stiffness is calculated by considering 100 $\mu$m insulation can penetrate into the metal part. The normal contact stiffness is calculated as
$$
f_{kn} = \frac{E}{t}
$$
where $E$ is assumed as 5GPa, and t is 100 $\mu$m.

## material property for the laminated collar
The collar is laminated and it has very low longitudinal modulus. We assume the longitudinal modulus is 10% of the original material. The collar is modelled with 2 overlapped collar blocks. To eliminate the overlap, the transverse modulus is divided by 2. The modulus and poisson ratio are shown in below.
- Youngs' modulus, $E_{x} = E_{y} = 0.5E; E_{z} = 0.1E$
- Poisson ratio, $v_{xy} = v; v_{yz} = v_{zx} = 0$
- Shear modulus, $G_{xy} = \frac{0.5E}{2(1+v)}; G_{yz} = \frac{0.5E}{2}; G_{zx} = \frac{0.1E}{2}$
 
## contact setup
| contact ID | target ID | contact part                    | target part               | status   |
|------------|-----------|---------------------------------|---------------------------|----------|
|10          |110        |coil pack (layer-1)              |coil insulation (layer-1)  |frictional|
|11          |111        |coil insulation (layer-1)        |coil pack (layer-2)        |frictional|
|12          |112        |coil pack (layer-2)              |coil insulation (layer-2)  |frictional|
|13          |113        |end spacer                       |wedge	               |frictional|
|20          |120        |wedge front side (layer-1)	   |coil back side (layer-1)   |frictional|
|21          |121        |wedge back side (layer-1)	   |coil front side (layer-1)  |frictional|
|22          |122        |end spacer-1 front side (layer-1)|coil-1 back side (layer-1) |frictional|
|23          |123        |end spacer-2 front side (layer-1)|coil-2 back side (layer-1) |frictional|
|24          |124        |end spacer-3 front side (layer-1)|coil-3 back side (layer-1) |frictional|
|25          |125        |end shoe front side (layer-1)    |coil-4 back side (layer-1) |frictional|
|26          |126        |pole tip (layer-1)               |coil (layer-1)             |frictional|
|27          |127        |end spacer-1 back side (layer-1) |coil-2 front side (layer-1)|frictional|
|28          |128        |end spacer-2 back side (layer-1) |coil-3 front side (layer-1)|frictional|
|29          |129        |end spacer-3 back side (layer-1) |coil-4 front side (layer-1)|frictional|
|80          |180        |wedge front side (layer-2)       |coil back side (layer-2)   |frictional|
|81          |181        |wedge back side (layer-2)        |coil front side (layer-2)  |frictional|
|82          |182        |end spacer-1 front side (layer-2)|coil-1 back side (layer-2) |frictional|
|83          |183        |end spacer-2 front side (layer-2)|coil-2 back side (layer-2) |frictional|
|84          |184        |end spacer-3 front side (layer-2)|coil-3 back side (layer-2) |frictional|
|85          |185        |end shoe front side (layer-2)    |coil-4 back side (layer-2) |frictional|
|86          |186        |pole tip (layer-2)               |coil (layer-2)             |frictional|
|87          |187        |end spacer-1 back side (layer-2) |coil-2 front side (layer-2)|frictional|
|88          |188        |end spacer-2 back side (layer-2) |coil-3 front side (layer-2)|frictional|
|89          |189        |end spacer-3 back side (layer-2) |coil-4 front side (layer-2)|frictional|
|90          |190        |coil21                           |coil22                     |frictional|
|91          |191        |coil23                           |coil24                     |frictional|
|30          |130        |coil insulation (layer-2)        |top collar                 |frictional|
|32          |132        |coil insulation (layer-2)        |bot collar                 |frictional|
|33          |133        |top collar                       |iron pad                   |frictional|
|34          |134        |bot collar                       |iron pad                   |frictional|
|35          |135        |iron yoke                        |shell                      |frictional|
|37          |137        |collar extension                 |bot collar                 |frictional|
|38          |138        |horizontal key                   |iron yoke                  |frictional|
|39          |139        |vertical key                     |iron yoke                  |frictional|
|40          |140        |end plate                        |end shoe                   |frictional|
|42          |142        |end plate                        |iron yoke                  |frictional|
|43          |143        |end plate                        |axial rod                  |bonded    |
|44          |144        |axial rod                        |nut                        |bonded    |
|50          |150        |coil (layer-1)                   |nose top                   |frictional|
|51          |151        |coil (layer-1)                   |nose bot                   |frictional|
|52          |152        |coil (layer-2)                   |nose top                   |frictional|
|53          |153        |coil (layer-2)                   |nose bot                   |frictional|
|60          |160        |pole tip                         |nose top                   |frictional|
|61          |161        |pole tip                         |nose bot                   |frictional|
|70+i        |170+i      |shell-i                          |shell-j                    |frictional|
|200+i       |300+i      |pad-i                            |pad-j                      |frictional|
|220+i       |320+i      |collar top-i                     |collar top-j               |frictional|
|230+i       |330+i      |collar ext-i                     |collar ext-j               |frictional|

## material
| part            | material       |
|-----------------|----------------|
| pole tip        | Ti6Al4V        |
| collar          | SS316          |
| wedge           | Al-Br          |
| end spacer      | Al-Br          |
| end shoe        | Al-Br          |
| axial rod       | SS316          |
| shell           | A6061          |

## interference thickness
| middle plane | pole-coil | pole tip-coil | wedge-coil | espacer-coil front | espacer-coil back  | end shoe-coil  | axial shim |
|--------------|-----------|---------------|------------|--------------------|--------------------|----------------|------------|
| 0.4 -> 0.0   | 0.0       | 0.0           | 0.0        | 0.00/0.0/0.0       | 0.00/0.0/0.0       | 0.0            | 2.80       |
| 0.6 -> 0.0   | 0.0       | 0.0           | 0.0        | 0.00/0.0/0.0       | 0.00/0.0/0.0       | 0.0            | 2.80       |

## tapered shim 
### middle plane shim
The tapered middle plane shim is implemented by setting the azimuthal displacement constrain at the middle plane. The azimuthal displacement is implemented as
$$
u_{y} (z) =
\begin{cases}
 u_{y,0},                                              &  z \le z_{0}, \\
 (u_{y,1}-u_{y,0})\frac{z-z_{0}}{z_{1}-z_{0}}+u_{y,0}, & z_{0} < z \le z_{1}, \\
 u_{y,1},                                              & z_{1} < z \le z_{2} 
\end{cases} 
$$
- $z_{0}$, `coil_length-end_length`
    - maximum pole tip position
- $z_{1}$, `z0eshoe` 
    - in the middle of the end shoe
- $z_{2}$, `z1eshoe`
    - maximum end shoe position
#### pole shim
The pole shim also has the ramp region. Need to determine the ramp region from the end of the straight section, `l_ramp`. 

## case study
| case       | collar gap | mid shim      | hkey  | vkey  | axial interf | `z1_mid`   | `z0_mid`       |
|------------|------------|---------------|-------|-------|--------------|------------|----------------|
| case0      | 0.3mm      | 0.15mm/0.15mm | 0.0mm | 1.0mm | 1.8mm        | `z0eshoe`  | `coil_length-end_length`       |
| case1      | 0.5mm      | 0.40mm/0.60mm | 0.2mm | 0.3mm | 1.8mm        | `z0eshoe`  | `coil_length-end_length-150e-3`       |
| case2      | 0.5mm      | 0.40mm/0.60mm | 0.2mm | 0.3mm | 1.8mm        | `z0eshoe+20e-3` | `coil_length-end_length-150e-3`       |
| case3      | 0.5mm      | 0.40mm/0.60mm | 0.2mm | 0.3mm | 1.8mm        | `z0eshoe+50e-3` | `coil_length-end_length`       |
| case4      | 0.5mm      | 0.40mm/0.60mm | 0.2mm | 0.3mm | 1.8mm        | `z0eshoe-20e-3` | `coil_length-end_length-150e-3`       |
| case5      | 0.5mm      | 0.40mm/0.60mm | 0.2mm | 0.3mm | 1.8mm        | `z0eshoe+50e-3` | `coil_length-end_length+10e-3`   |
| case6      | 0.5mm      | 0.40mm/0.60mm | 0.2mm | 0.3mm | 1.8mm        | `z0eshoe+50e-3` | `coil_length-end_length+20e-3`   |
| case7      | 0.5mm      | 0.40mm/0.60mm | 0.2mm | 0.3mm | 1.8mm        | `z0eshoe+50e-3` | `coil_length-end_length-250e-3`   |
| case8      | 0.5mm      | 0.40mm/0.60mm | 0.2mm | 0.3mm | 1.8mm        | `z0eshoe+50e-3` | `coil_length-end_length-150e-3`   |
| case9      | 0.5mm      | 0.40mm/0.60mm | 0.2mm | 0.3mm | 1.8mm        | `z0eshoe+25e-3` | `coil_length-end_length-60e-3`  |
| case10     | 0.0mm      | 0.40mm/0.60mm | 0.3mm | 0.4mm | 1.8mm        | `z0eshoe+50e-3` | `coil_length-end_length-150e-3`  |
| case11     | 0.3mm      | 0.40mm/0.60mm | 0.3mm | 0.5mm | 1.85mm       | `z0eshoe+50e-3` | `coil_length-end_length-350e-3`  |
| case12     | 0.5mm      | 0.40mm/0.60mm | 0.4mm | 0.5mm | 2.05mm       | `z0eshoe+50e-3` | `coil_length-end_length-200e-3`  |
| case13     | 0.5mm      | 0.40mm/0.60mm | 0.2mm | 0.3mm | 1.8mm        | `z0eshoe+50e-3` | `coil_length-end_length-300e-3`  |
