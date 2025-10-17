import { expect } from "chai";
import { ethers } from "hardhat";

describe("HelloWorld contract", function () {
  let hello: any;

  beforeEach(async function () {
    // 直接用 ethers 获取合约工厂
    const HelloWorld = await ethers.getContractFactory("HelloWorld");
    hello = await HelloWorld.deploy();
    await hello.waitForDeployment(); // ethers v6 中等待部署完成的方法
  });

  it("should return 'Hello World' and print console logs", async function () {
    const msg = await hello.sayHello();
    expect(msg).to.equal("Hello World");
  });
});
