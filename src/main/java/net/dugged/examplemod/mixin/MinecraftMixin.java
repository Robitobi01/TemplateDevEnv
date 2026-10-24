package net.dugged.examplemod.mixin;

import net.dugged.examplemod.ExampleMod;
import net.minecraft.client.Minecraft;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@Mixin(Minecraft.class)
public abstract class MinecraftMixin {
    @Inject(method = "init", at = @At("TAIL"))
    private void examplemod$afterInit(CallbackInfo ci) {
        ExampleMod.LOGGER.info("Example client mixin initialized");
    }
}
