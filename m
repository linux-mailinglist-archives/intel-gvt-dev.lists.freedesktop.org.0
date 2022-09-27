Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9CA5ECF9E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 27 Sep 2022 23:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D495110E13E;
	Tue, 27 Sep 2022 21:54:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A5B10E13E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 27 Sep 2022 21:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664315674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZzJ0d2P7ikWA32yAcih+LzhGSM0xnRgmRpdOhVozRU=;
 b=T5FwTkm4Sf1+8pLOWmaD5VpUEhCTMxKj5r0NNPlJ+2h0Zy1mlGdi2Yzq+VfdIpc2WYL0bN
 BwBcUOGvTKG+I3XMPdzaoTkewZOVquOIS1KTRvBh5zbAoik+RdjMvbBUKB6o0giSqACgS0
 ptc26WPUnhIbaLfmGnF4YK4/L+TeI0c=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-KuDdeK-PPvek69-icZYAsw-1; Tue, 27 Sep 2022 17:54:33 -0400
X-MC-Unique: KuDdeK-PPvek69-icZYAsw-1
Received: by mail-io1-f72.google.com with SMTP id
 f25-20020a5d8799000000b006a44e33ddb6so6558866ion.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 27 Sep 2022 14:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rZzJ0d2P7ikWA32yAcih+LzhGSM0xnRgmRpdOhVozRU=;
 b=7Zku4Kbl4NZ/9xBVmmIRDadVRQgfb37tpubSq4japNFaWtAiOm2KoBX13fQ7Aqwm0S
 Xz/HEUv8vAsjjRfDn5hNKh2ohKWIMgGW2fwxfYjUIuzG17uzV74yVhvjjOrJ14GUj4h3
 LdrAqBjr4sngO9FrhzeSC3gCPPjkh7NYCqdgaJCJLNRQXRMYus3pr90AOBYzV9BfJNxm
 ZH/dbX4xEK9084jV+zJVLImcxmEr2L0kRBj7mFC7H/UVsWSR+/es09qqsOAE0e8Ay1pw
 P0V5G0v+u3rn1QyViaJDFxftUlW4HW3qEALd28cVtyYbSsPt0P8eZNsek6mlGNoRvy42
 N+JA==
X-Gm-Message-State: ACrzQf0Fwaz08eRWzInvqF+jkI1wiFQB+vwIurMSN4PHiw7Xq2dupm3j
 fBfmN444afYjPkEL8JsxnmKizDQrCyxiBNKmjSkjdO0vJ5UflhZ+HXPXxIsKxgfgK4jZvOtoPEr
 EE5CJ6qn6+F9lRZROHvoPMUX459wdvpggSQ==
X-Received: by 2002:a05:6e02:12c6:b0:2f6:5f42:89ed with SMTP id
 i6-20020a056e0212c600b002f65f4289edmr13738516ilm.153.1664315669415; 
 Tue, 27 Sep 2022 14:54:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58fQvCqD5ZPjUzJ6YttmTNX+eReUM5WIfUb7VKW6HusYb6PDM+YxmVl6VkO0au8ckJVis+Bg==
X-Received: by 2002:a05:6e02:12c6:b0:2f6:5f42:89ed with SMTP id
 i6-20020a056e0212c600b002f65f4289edmr13738509ilm.153.1664315669186; 
 Tue, 27 Sep 2022 14:54:29 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a12-20020a02940c000000b0035a872cdad8sm351146jai.157.2022.09.27.14.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 14:54:28 -0700 (PDT)
Date: Tue, 27 Sep 2022 15:54:26 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: simplify the mdev interface v8
Message-ID: <20220927155426.23f4b8e9.alex.williamson@redhat.com>
In-Reply-To: <20220927140737.0b4c9a54.alex.williamson@redhat.com>
References: <20220923092652.100656-1-hch@lst.de>
 <20220927140737.0b4c9a54.alex.williamson@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 27 Sep 2022 14:07:37 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Fri, 23 Sep 2022 11:26:38 +0200
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > Hi all,
> > 
> > this series significantly simplifies the mdev driver interface by
> > following the patterns for device model interaction used elsewhere in
> > the kernel.
> > 
> > Changes since v7:
> >  - rebased to the latests vfio/next branch
> >  - move the mdev.h include from cio.h to vfio_ccw_private.h
> >  - don't free the parent in mdev_type_release
> >  - set the pretty_name for vfio_ap
> >  - fix the available_instances check in mdev_device_create  
> 
> Thanks for your persistence, I think all threads are resolved at this
> point.  Applied to vfio next branch for v6.1.  Thanks,

Oops, I had to drop this, I get a null pointer from gvt-g code:

[   92.132636] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   92.139597] #PF: supervisor read access in kernel mode
[   92.144734] #PF: error_code(0x0000) - not-present page
[   92.149865] PGD 0 P4D 0 
[   92.152405] Oops: 0000 [#2] PREEMPT SMP PTI
[   92.156592] CPU: 2 PID: 950 Comm: mdevctl Tainted: G      D W          6.0.0-rc4+ #1
[   92.164330] Hardware name:  /NUC5i5MYBE, BIOS MYBDWi5v.86A.0054.2019.0520.1531 05/20/2019
[   92.172495] RIP: 0010:intel_vgpu_get_available+0x7e/0xb0 [kvmgt]
[   92.178518] Code: 00 45 2b a5 a0 00 00 00 89 d1 41 2b 8d 90 00 00 00 29 d3 41 83 ec 04 8d a9 00 00 00 f8 e8 fa f3 43 e1 49 8b 4e 70 89 e8 31 d2 <f7> 31 31 d2 89 c5 44 89 e0 f7 71 08 39 c5 0f 47 e8 89 d8 31 d2 5b
[   92.197264] RSP: 0018:ffffaf57818ffd80 EFLAGS: 00010246
[   92.202490] RAX: 0000000038000000 RBX: 00000000a8000000 RCX: 0000000000000000
[   92.209622] RDX: 0000000000000000 RSI: ffffffffc0454160 RDI: ffff9b389aaa8000
[   92.216747] RBP: 0000000038000000 R08: ffff9b3881826f08 R09: ffff9b38969aeb40
[   92.223879] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000001c
[   92.231004] R13: ffff9b389aaa8000 R14: ffff9b3881826ef0 R15: 0000000000000001
[   92.238136] FS:  00007f2f76f12800(0000) GS:ffff9b3bf6d00000(0000) knlGS:0000000000000000
[   92.246222] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   92.251968] CR2: 0000000000000000 CR3: 000000011686e002 CR4: 00000000003706e0
[   92.259101] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   92.266234] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   92.273366] Call Trace:
[   92.275811]  <TASK>
[   92.277919]  available_instances_show+0x1f/0x60 [mdev]
[   92.283055]  sysfs_kf_seq_show+0xa3/0xe0
[   92.286983]  seq_read_iter+0x122/0x450
[   92.290735]  vfs_read+0x1d2/0x2a0
[   92.294056]  ksys_read+0x53/0xd0
[   92.297286]  do_syscall_64+0x5b/0x80
[   92.300866]  ? syscall_exit_to_user_mode+0x17/0x40
[   92.305659]  ? do_syscall_64+0x67/0x80
[   92.309412]  ? exc_page_fault+0x70/0x170
[   92.313337]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   92.318388] RIP: 0033:0x7f2f76d01852
[   92.321977] Code: c0 e9 b2 fe ff ff 50 48 8d 3d 9a d0 0b 00 e8 55 f6 01 00 0f 1f 44 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 0f 05 <48> 3d 00 f0 ff ff 77 56 c3 0f 1f 44 00 00 48 83 ec 28 48 89 54 24
[   92.340725] RSP: 002b:00007fff85c74b58 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[   92.348290] RAX: ffffffffffffffda RBX: 0000000000001000 RCX: 00007f2f76d01852
[   92.355422] RDX: 0000000000001000 RSI: 0000562f18d61120 RDI: 0000000000000005
[   92.362555] RBP: 0000000000001000 R08: 00007f2f76df8eb0 R09: 00007f2f76df8eb0
[   92.369689] R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff85c74c58
[   92.376820] R13: 0000000000000000 R14: 00007fff85c74c70 R15: 0000000000000005
[   92.383946]  </TASK>
[   92.386137] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill nfnetlink qrtr sunrpc vfat fat snd_hda_codec_realtek snd_hda_codec_generic snd_hda_codec_hdmi ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep mei_pxp intel_rapl_msr intel_rapl_common snd_pcm x86_pkg_temp_thermal intel_powerclamp coretemp mei_wdt mei_hdcp kvm_intel mei_me rapl mei intel_cstate snd_timer snd at24 intel_uncore soundcore iTCO_wdt intel_pmc_bxt iTCO_vendor_support lpc_ich pcspkr i2c_i801 i2c_smbus acpi_pad fuse zram kvmgt vfio_iommu_type1 vfio kvm irqbypass i915 mdev drm_buddy crct10dif_pclmul crc32_pclmul drm_display_helper crc32c_intel cec e1000e ghash_clmulni_intel ttm video pinctrl_lynxpoint
[   92.386194] Unloaded tainted modules: acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1 pcc_cpufreq():1 pcc_cpufreq():1 pcc_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
[   92.504665] CR2: 0000000000000000
[   92.507982] ---[ end trace 0000000000000000 ]---
[   92.512603] RIP: 0010:intel_vgpu_get_available+0x7e/0xb0 [kvmgt]
[   92.518626] Code: 00 45 2b a5 a0 00 00 00 89 d1 41 2b 8d 90 00 00 00 29 d3 41 83 ec 04 8d a9 00 00 00 f8 e8 fa f3 43 e1 49 8b 4e 70 89 e8 31 d2 <f7> 31 31 d2 89 c5 44 89 e0 f7 71 08 39 c5 0f 47 e8 89 d8 31 d2 5b
[   92.537370] RSP: 0018:ffffaf5780557d20 EFLAGS: 00010246
[   92.542598] RAX: 0000000038000000 RBX: 00000000a8000000 RCX: 0000000000000000
[   92.549729] RDX: 0000000000000000 RSI: ffffffffc0454160 RDI: ffff9b389aaa8000
[   92.556861] RBP: 0000000038000000 R08: ffff9b3881826e90 R09: ffff9b3897860240
[   92.563987] R10: 0000000000000000 R11: 0000000000000001 R12: 000000000000001c
[   92.571119] R13: ffff9b389aaa8000 R14: ffff9b3881826e78 R15: 0000000000000001
[   92.578251] FS:  00007f2f76f12800(0000) GS:ffff9b3bf6d00000(0000) knlGS:0000000000000000
[   92.586336] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   92.592074] CR2: 0000000000000000 CR3: 000000011686e002 CR4: 00000000003706e0
[   92.599199] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   92.606333] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

