Dual core: single application using both cores approach to programming the ADSP-BF561
-------------------------------------------------------------------------------------

You have created a dual core: single application approach for the ADSP-BF561
processor. This type of standard application includes a hierarchy of five
projects built as a single application. This is the most powerful approach to
programming the ADSP-BF561, as it allows for all shared memory areas to be used
efficiently by both cores. Common code can be placed in shared memory to avoid
duplication, and shared data can be placed in shared memory without the need
for explicit positioning.

If you selected the 'Add template code to the application' option in the
Project Wizard, your project will contain template code to help you get
started, including a 'main' function in both cores and example code
demonstrating how to share data and code between the two cores. If you did not
select the option, you will need to declare your own 'main' functions in the
coreA and coreB projects. The sml2 and sml3 projects are used to share code and
data in internal and external shared memory areas, respectively.

For more information regarding programming for the ADSP-BF561, refer to the
VisualDSP++ 5.0 C/C++ Compiler and Library Manual for Blackfin Processors at:
http://www.analog.com/processors/blackfin/technicalLibrary/manuals
Appendix A contains more information specifically targeted at programming
multicore projects.

For an example of the dual core: one application per core approach to
programming the ADSP-BF561, refer to the Rot13 Dual-Core example project at:
.\VisualDSP++5.0\Blackfin\Examples\No Hardware Required\Compiler Features\Rot13 Dual-Core.dpg