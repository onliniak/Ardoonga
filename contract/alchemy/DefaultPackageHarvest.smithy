$version: "2"
namespace ga.ardoon.alchemy

@documentation("Azgaar's Fantasy Map Generator extension.")
service Harvest {
    version: "0.1"
    operations: []
}

//namespace quicktype

document NullValue

structure Farmland {
@required name : String,
@required price : Long,
@required angle : Long,
@required length : Long,
@required weight : Long,
@required laborious : Long,
@required offensive : Long,
@required defensive : Long,
@required thickness : Long,
@required material : Material
}

structure Material {
@required strength : Long,
@required hardness : Long,
@required ductility : Long,
@required density : Long,
@required melting_point : Long,
@required corrosion_resistance : Long
}

structure Potion {
@required name : String,
@required price : Long,
@required elements : elementsList
}
list elementsList{ member: Element}

structure Element {
@required statistics : statisticsList,
@required element_physical_property : ElementPhysicalProperty
}
list statisticsList{ member: Statistic}

structure ElementPhysicalProperty {
@required flora : Flora,
@required metal : Material
}

structure Flora {
@required taste : Long,
@required smell : Long,
@required colour : Long
}

structure Statistic {
@required id : Long,
@required type : Long,
@required power : Long
}
