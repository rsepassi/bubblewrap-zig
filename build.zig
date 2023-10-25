const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{
        .default_target = std.zig.CrossTarget{
            .abi = .musl,
        },
    });
    const optimize = b.standardOptimizeOption(.{});

    const libcap = b.dependency("libcap_zig", .{
        .target = target,
        .optimize = optimize,
    });
    const libcap_lib = libcap.artifact("cap");

    const exe = b.addExecutable(.{
        .name = "bwrap",
        .target = target,
        .optimize = optimize,
        .linkage = .static,
    });
    exe.addIncludePath(.{ .path = "include" });
    exe.addCSourceFiles(&c_sources, &[_][]const u8{});
    exe.linkLibrary(libcap_lib);
    exe.linkLibC();
    exe.strip = true;
    b.installArtifact(exe);
}

const c_sources = [_][]const u8{
    "src/bind-mount.c",
    "src/bubblewrap.c",
    "src/network.c",
    "src/utils.c",
};
