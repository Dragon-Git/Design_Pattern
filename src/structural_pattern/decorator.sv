//用实现以下功能，
//需求是为装备附魔，装备分为武器和防具，
//武器有刀，剑，防具为头盔，铠甲，
//附魔效果为火焰，冰霜，雷电，中毒，
//并添加人物类和打斗效果

// 定义枚举类型表示装备类型 
typedef enum bit [2:0] {
  WEAPON = 3'b001,
  ARMOR  = 3'b010
} EquipmentType;

// 定义抽象装备类 
class Equipment;

  EquipmentType equip_type;
  string name;
  string enchantments[$];

  // 构造函数 
  function new(EquipmentType equip_type, string equip_name);
    equip_type = equip_type;
    name = equip_name;
  endfunction

  // 获取装备名称 
  function string get_equip_name();
    return name;
  endfunction

  // 添加附魔效果 
  function void add_enchantment(string enchantment);
    enchantments.push_back(enchantment);
  endfunction

  // 显示装备信息 
  function void display();
    $display("Equipment: %s", get_equip_name());
    foreach (enchantments[i]) begin
      $display("Enchantment: %s", enchantments[i]);
    end
  endfunction

  // 装备攻击或防御方法（抽象） 
  virtual function void action();
  endfunction
endclass

// 具体武器类 - 刀 
class Knife extends Equipment;

  function new();
    super.new(WEAPON, "Knife");
  endfunction

  // 攻击方法 - 刀攻击 
  function void action();
    $display("Attacking with a Knife!");
  endfunction

endclass

// 具体武器类 - 剑 
class Sword extends Equipment;

  function new();
    super.new(WEAPON, "Sword");
  endfunction

  // 攻击方法 - 剑攻击 
  function void action();
    $display("Attacking with a Sword!");
  endfunction

endclass

// 具体防具类 - 头盔 
class Helmet extends Equipment;

  function new();
    super.new(ARMOR, "Helmet");
  endfunction

  // 防御方法 - 头盔防御 
  function void action();
    $display("Defending with a Helmet!");
  endfunction

endclass

// 具体防具类 - 铠甲 
class Chestplate extends Equipment;

  function new();
    super.new(ARMOR, "Chestplate");
  endfunction

  // 防御方法 - 铠甲防御 
  function void action();
    $display("Defending with a Chestplate!");
  endfunction

endclass

// 定义装饰器类 - 附魔效果 
class EnchantmentDecorator extends Equipment;

  Equipment equip;

  // 构造函数 
  function new(Equipment equip_obj);
    super.new(equip_obj.equip_type, equip_obj.name);
    equip = equip_obj;
  endfunction

  // 添加附魔效果 
  function void add_enchantment(string enchantment);
    equip.add_enchantment(enchantment);
  endfunction

  // 重写显示装备信息的方法 
  virtual function void display();
    equip.display();
  endfunction

  // 重写装备攻击或防御方法 
  virtual function void action();
    equip.action();
  endfunction

endclass

// 具体装饰器类 - 火焰附魔 
class FireEnchantment extends EnchantmentDecorator;

  function new(Equipment equip_obj);
    super.new(equip_obj);
  endfunction

  // 攻击或防御方法 - 带火焰附魔的行为 
  function void action();
    super.action();
    $display("Enchantment: Fire");
  endfunction

endclass
// 具体装饰器类 - 冰霜附魔 
class FrostEnchantment extends EnchantmentDecorator;

  function new(Equipment equip_obj);
    super.new(equip_obj);
  endfunction

  // 攻击或防御方法 - 带冰霜附魔的行为 
  function void action();
    super.action();
    $display("Enchantment: Frost");
  endfunction

endclass
// 具体装饰器类 - 雷电附魔 
class LightningEnchantment extends EnchantmentDecorator;

  function new(Equipment equip_obj);
    super.new(equip_obj);
  endfunction

  // 攻击或防御方法 - 带雷电附魔的行为 
  function void action();
    super.action();
    $display("Enchantment: Lightning");
  endfunction

endclass

// 测试程序 
module top;
  initial begin
    // 创建不同类型的武器和防具 
    Equipment knife = Knife::new();
    Equipment sword = Sword::new();
    Equipment helmet = Helmet::new();
    Equipment chestplate = Chestplate::new();
    // 添加附魔效果 
    Equipment fire_sword = FireEnchantment::new(sword);
    Equipment frost_knife = FrostEnchantment::new(knife);
    Equipment lightning_helmet = LightningEnchantment::new(helmet);
    fire_sword.add_enchantment("Fire");
    frost_knife.add_enchantment("Frost");
    lightning_helmet.add_enchantment("Lightning");
    lightning_helmet.add_enchantment("Fire");
    // 武器和防具的攻击或防御 
    fire_sword.action();
    frost_knife.action();
    lightning_helmet.action();
    fire_sword.display();
    frost_knife.display();
    lightning_helmet.display();
  end
endmodule
