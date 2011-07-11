using System;
using System.Linq;
using Microsoft.Practices.Prism.Modularity;
using StructureMap.Graph;

namespace $rootnamespace$.Bootstrap
{
    public class ModuleRegistry : StructureMap.Configuration.DSL.Registry
    {
        public ModuleRegistry()
        {
            Scan(s =>
                {
                    s.AssembliesFromApplicationBaseDirectory();
                    s.AddAllTypesOf<IModule>();
                });
            ForSingletonOf<IModuleManager>().Use<ModuleManager>();
        }
    }
}