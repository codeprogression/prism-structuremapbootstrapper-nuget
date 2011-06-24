StructureMapBootstrapper for WPF Prism Applications
===================================================

Adds 3 files to a Bootstrap folder:

* Bootstrapper.cs - Class to reference and call in App.xaml.cs, i.e.: `new Bootstrapper.Run()`

* ModuleRegistry.cs - Handles registration of any IModule classes

* StructureMapBootstrapper.cs - Modeled after the UnityBootstrapper (but with StructureMap goodness)
