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
                    s.Convention<ModuleConvention>();
                });
            ForSingletonOf<IModuleManager>().Use<ModuleManager>();
        }
    }
    public class ModuleConvention : IRegistrationConvention
    {
        public void Process(Type type, StructureMap.Configuration.DSL.Registry registry)
        {
            if (type.GetInterfaces().Contains(typeof(IModule)))
                registry.AddType(typeof(IModule), type);
        }

    }
}