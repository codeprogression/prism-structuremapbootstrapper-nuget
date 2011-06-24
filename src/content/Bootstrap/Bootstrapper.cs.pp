using System;
using System.Windows;
using Microsoft.Practices.Prism.Modularity;

namespace $rootnamespace$.Bootstrap
{
    public class Bootstrapper : StructureMapBootstrapper
    {
        protected override void ConfigureContainer()
        {
            Container.Configure(x =>
                {
                    x.AddRegistry<ModuleRegistry>();
                    x.Scan(s =>
                        {
                            s.AssembliesFromApplicationBaseDirectory();
                            s.WithDefaultConventions();
                        });
                });
            base.ConfigureContainer();
        }

        protected override IModuleCatalog GetModuleCatalog()
        {
            var moduleCatalog = new ModuleCatalog();
            foreach (var module in Container.GetAllInstances<IModule>())
            {
                moduleCatalog.AddModule(module.GetType());
            }
            return moduleCatalog;
        }

        protected override DependencyObject CreateShell()
        {
            throw new NotImplementedException();
        }
        
    }
}